module Cloudwalk
  class App
    CW_FILE_PATH      = "./Cwfile.json"
    CW_FILE_LOCK_PATH = "./Cwfile.json.lock"
    COMMANDS          = [
      "upgrade-version"
    ]
    VERSION_REGEX = /[0-9]+\.[0-9]+\.[0-9]+\.\.[0-9]+\.[0-9]+\.[0-9]+/

    class << self
      attr_accessor :command, :application, :parameter, :error
    end
    self.error = ""

    def self.run(*args)
      if Manager::User.logged?
        self.command     = args.shift
        self.application = args.shift
        self.parameter   = args.shift
        self.execute
      else
        puts "User must be logged, execute: \"cloudwalk login\""
      end
    end

    def self.execute
      if self.valid_execution?
        case command
        when "upgrade-version"
          self.upgrade_posxml_version(self.application, self.parameter)
        end
      else
        puts self.error
      end
    end

    def self.valid_execution?
      command_check = COMMANDS.include?(self.command)
      puts "Command \"#{self.command}\" not found\n" unless command_check

      version_check = VERSION_REGEX.match(self.parameter)
      puts "Version not valid, user this format: <version old>..<version new>, 1.0.25..1.0.26\n" unless version_check

      if ! self.application.include?(".xml") && ! self.application.include?(".posxml")
        self.application = self.application + ".posxml"
      end

      command_check && version_check
    end

    def self.cwfile
      if File.exists?(CW_FILE_LOCK_PATH)
        txt = File.read(CW_FILE_LOCK_PATH)
        if ! txt.empty?
          JSON.parse(txt)
        end
      end
    end

    def self.upgrade_posxml_version(app_name, parameter)
      version1, version2 = parameter.split("..")
      if apps = self.cwfile
        apps.find {|app| app["name"] }
      else
        if json_app = self.app(app_name)
          versions = Manager::Version.all(json_app["id"])
          version1_json = versions.find {|version| version["app_version"]["number"] == version1 }
          version2_json = versions.find {|version| version["app_version"]["number"] == version2 }
          if version1_json
            if version2_json
              puts "Version #{version1} already created for app #{self.application}"
            else
              self.create_version(version1_json["app_version"], version2)
            end
          else
            puts "Version #{version1} not found for app #{self.application}"
          end
        else
          puts "Application not found"
        end
      end
    end

    def self.create_version(old, number)
      parameters = {
        "number"            => number,
        "app_id"            => old["app_id"],
        "displayable"       => old["displayable"],
        "pos_display_label" => old["pos_display_label"],
        "authorizer_url"    => old["authorizer_url"],
        "base_version_id"   => old["id"]
      }
      Manager::Version.create(parameters)
    end

    def self.app(name)
      application = Manager::Application.all.find do |application|
        application["posxml_app"]["name"] == xml2posxml(name)
      end
      application["posxml_app"] if application
    end

    def self.posxml2xml(str)
      str.sub(".posxml", ".xml")
    end

    def self.xml2posxml(str)
      str.sub(".xml", ".posxml")
    end
  end
end