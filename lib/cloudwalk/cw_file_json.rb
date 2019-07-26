#lib/pos/base.rb:              json_versions = `curl -k -X GET \"https://#{host}/v1/apps/posxml/#{cw_main_id}/versions?access_token=#{token}\"`
#lib/pos/package_util.rb:      json_version  = `curl -k -X GET \"https://#{host}/v1/apps/posxml/#{app_id}/versions/#{version_id}?access_token=#{token}\"`
#lib/pos/package_util.rb:           app_json = `curl -k -X GET \"https://#{host}/v1/apps/posxml/#{app_id}/?access_token=#{token}\"`
#lib/pos/package_util.rb:          file_json = `curl -k -X GET \"https://#{host}/v1/files/#{file_id}/?access_token=#{token}\"`
#
# - Lock is a file that contains the id of applications.
#
# What to do:
#
# 1. Check if lock exists and create it.
# - If not update create .lock by checking applications
# 2. Check if all applications has an id.
#
# Commands
# - "cloudwalk app upgrade-version  cw_main.xml 1.10.10..1.2.0"
#   - Can be used for a module
#   - Change Cwfile.json and Cwfile.json.lock
# - rake cloudwalk:deploy
#  - Read Cwfile.json
#  - Check if apps and versions are ok

module Cloudwalk
  class CwFileJson
    include Cloudwalk::ManagerHelper

    CW_FILE_LOCK_PATH = "./Cwfile.json.lock"
    CW_FILE_PATH      = "./Cwfile.json"

    class << self
      attr_accessor :cwfile, :lock
    end

    def self.load_cwfile_lock
      JSON.parse(File.read(CW_FILE_LOCK_PATH))
    rescue Errno::ENOENT
      false
    rescue JSON::ParserError
      puts "Error to read Cwfile.json.lock"
      false
    end

    def self.load_cwfile
      JSON.parse(File.read(CW_FILE_PATH))
    rescue Errno::ENOENT
      puts "Cwfile.json not found"
      false
    rescue JSON::ParserError
      puts "Error to read Cwfile.json"
      false
    end

    # Load Scenarios
    # 1. Pure true
    # - Cwfile.json exists.
    # - Cwfile.json.lock exists.
    # - json and lock are the same
    # R: Just execute :)
    #
    # 2.
    # - Cwfile.json exists.
    # - Cwfile.json.lock exists.
    # - json and lock aren't the same
    #
    # Response:
    #  WARN: Warning Cwfile.json and Cwfile.json.lock are different, please fix, follow differences:
    #
    # User Actions:
    #  - The user can delete Cwfile.json.lock
    #  - The user can fix Cwfile.json
    #
    # Scenarios:
    #  - The user could create a version on manager and just updated Cwfile.json, instead of delete Cwfile.json.lock
    #    - Maybe create an update action, rake cloudwalk:update
    #  - The user
    #
    # 3.
    # - Cwfile.json exists.
    # - Cwfile.json.lock not exists.
    # R: Create Cwfile.json.lock
    #
    # 4.
    # - Cwfile.json not exists.
    # - Cwfile.json.lock not exists.
    # R: ASK: Cwfile.json not exists, should I create a skeleton or get the last versions available for the files we have here?
    def self.setup(without_lock_check = false)
      if self.cwfile = load_cwfile
        if without_lock_check
          true
        elsif CwFileJson.exists_lock?
          if self.lock = load_cwfile_lock
            self.compare
          end
        else
          persist_lock!
        end
      end
    end

    def self.delete_lock!
      FileUtils.rm_rf CW_FILE_LOCK_PATH
    end

    def self.persist_lock!
      File.open(CW_FILE_LOCK_PATH, "w") do |file|
        file.write(JSON.pretty_generate(self.lock_build))
      end
    end

    def self.lock_build
      config = []
      self.cwfile["apps"].each do |app_local|
        app, version = Cloudwalk::Posxml::PosxmlVersion.find(app_local["name"], app_local["version"])
        if app && version
          detail = Cloudwalk::Posxml::PosxmlVersion.get(app["id"], version["id"])
          config << build_application(app, version, detail["module_ids"])
        elsif app
          app = Cloudwalk::Application.find(xml2posxml(app_local["name"]))

          config << build_application(app, app_local["version"], app_local["modules"])
        else
          raise Cloudwalk::CwFileJsonException.new("App (#{app_local["name"]}) Version (#{app_local["version"]}) not found")
        end
      end

      self.lock = config
    end

    def self.build_module(mod)
      if module_version = Cloudwalk::Posxml::PosxmlVersion.get(mod["app_id"], mod["version_id"])
        {
          "name"       => Cloudwalk::Posxml::PosxmlApplication.get_name(module_version["app_id"]),
          "version"    => module_version["number"],
          "id"         => module_version["app_id"],
          "version_id" => module_version["id"]
        }
      else
        raise Cloudwalk::CwFileJsonException.new("App (#{mod['app_id']}) Module Version (#{mod['version_id']}) not found")
      end
    end

    def self.build_application(type, app, version = nil, modules_remote = nil)
      if type == :ruby
        {
          "name"       => app["name"],
          "id"         => app["id"],
          "modules"    => [],
          "version"    => version
        }
      else
        {
          "name"       => app["name"],
          "id"         => app["id"],
          "modules"    => modules_remote.collect {|mod| build_module(mod)},
          "version"    => version["number"],
          "version_id" => version["id"]
        }
      end
    end

    def self.exists?
      File.exists? CW_FILE_PATH
    end

    def self.exists_lock?
      File.exists? CW_FILE_LOCK_PATH
    end

    def self.ruby?
      if self.cwfile
        self.cwfile["runtime"] == "ruby"
      end
    end

    def self.cwfile_apps_and_versions
      if self.ruby?
        [self.cwfile["name"], self.cwfile["version"]]
      else
        self.cwfile["apps"].inject([]) do |array, app|
          array << [app["name"], app["version"]]
          app["modules"].each do |app_module|
            array << [app_module[0], app_module[1]]
          end
          array
        end
      end
    end

    def self.lock_apps_and_versions
      self.lock.inject([]) do |array, app|
        if self.ruby?
          array.concat([app["name"], app["version"]])
        else
          array << [posxml2xml(app["name"]), app["version"]]
          app["modules"].each do |app_module|
            array << [posxml2xml(app_module["name"]), posxml2xml(app_module["version"])]
          end
          array
        end
      end
    end

    # TODO future!

    def self.compare
      cwfile_list = self.cwfile_apps_and_versions
      lock_list = self.lock_apps_and_versions

      cwdiff = cwfile_list - lock_list
      lockdiff = lock_list - cwfile_list
      unless cwdiff.empty? && lockdiff.empty?
        puts "Warning Cwfile.json and Cwfile.json.lock are different, follow differences:"
        puts "Cwfile.json"
        puts cwdiff.inspect
        puts "Cwfile.json.lock"
        puts lockdiff.inspect
        false
      else
        true
      end
    end

    def compare_modules(local_app, module_ids)
      local_module_app_ids = local_app["modules"].inject([]) do |mods, app|
        mods << app["id"]
      end

      module_app_ids = module_ids.inject([]) do |mods, app|
        mods << app["app_id"]
      end

      local_creation = local_module_app_ids - module_app_ids
      remote_creation = module_app_ids - local_module_app_ids

      if local_creation.nil?
        raise ApplicationConfigError.new("Application #{local_app["name"]}: Local modules are missing #{local_creation}")
      end

      if remote_creation.nil?
        raise ApplicationConfigError.new("Application #{local_app["name"]}: Remote modules are missing #{local_creation}")
      end
    end

    # curl -X GET "https://api-staging.cloudwalk.io/v1/apps/posxml?access_token=TOKEN"
    # curl -X GET "https://manager.cloudwalk.io/v1/apps/posxml/3082/versions?access_token=TOKEN"
    def update_apps(list, apps, config)
      all = Cloudwalk::Posxml::PosxmlApplication.all
      list.each do |app, version|
        local_app = apps.find { |json| json["name"] == app }

        if app[-4..-1] == ".xml" # Check if is posxml application
          remote_app = all.find { |app_json| app_json["posxml_app"]["name"] == xml2posxml(app) }

          if remote_app
            remote_posxml_app   = remote_app["posxml_app"]
            remote_versions     = Cloudwalk::Posxml::PosxmlVersion.all(remote_posxml_app["id"])
            remote_version_json = remote_versions.find { |json| json["app_version"]["number"] == version }

            if remote_version_json && (remote_version = remote_version_json["app_version"])
              remote_version_detail = Cloudwalk::Posxml::PosxmlVersion.get(remote_posxml_app["id"], remote_version["id"])
              # TODO: Check if application exists locally
              build_application(local_app, config, remote_posxml_app, remote_version, remote_version_detail["app_version"]["module_ids"])
            else
              # TODO versions not found, what to do?
            end
          else
            # TODO app not found, what to do?
          end
        else
          # Ruby flow
        end
      end
    end
  end
end

