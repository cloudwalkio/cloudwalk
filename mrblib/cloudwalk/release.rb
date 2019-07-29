module Cloudwalk
  class Release
    VERSION_REGEX = /[0-9]+\.[0-9]+\.[0-9]+\.\.[0-9]+\.[0-9]+\.[0-9]+/

    class << self
      attr_accessor :command, :arguments
    end

    def self.run(*parameters)
      if ! parameters || parameters.empty?
        self.help
      else
        self.command   = parameters.shift
        self.arguments = parameters
        self.execute
      end
    end

    def self.execute
      case self.command
      when "list"
        self.list
      when "promote"
        self.promote
      when "new"
        self.version_new
      else
        puts "Commnad [#{self.command}] not found\n"
        self.help
      end
    end

    def self.list
      if self.arguments && ! self.arguments.empty?
        app = self.arguments.first
        if app && app_hash = self.app(app)
          self.show_list(Manager::Version.all(app_hash["id"]))
        else
          puts "Application not found\n"
        end
      else
        puts "Application name is missing\n"
        self.help
      end
    end

    def self.promote
      puts "Developing..."
    end

    def self.version_new
      app      = self.arguments[0]
      versions = self.arguments[1]

      if VERSION_REGEX.match(versions)
        self.upgrade_posxml_version(app, versions)
      else
        puts "Version not valid, user this format: <version old>..<version new>, 1.0.25..1.0.26"
      end
    end

    private
    def self.upgrade_posxml_version(app_name, parameter)
      version1, version2 = parameter.split("..")
      if json_app = self.app(app_name)
        versions = Manager::Version.all(json_app["id"])
        version1_json = versions.find {|version| version["app_version"]["number"] == version1 }
        version2_json = versions.find {|version| version["app_version"]["number"] == version2 }
        if version1_json
          if version2_json
            puts "Version #{version2} already created for app #{self.application}"
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

    def self.create_version(old, number)
      parameters = {
        "number"            => number,
        "app_id"            => old["app_id"],
        "displayable"       => old["displayable"],
        "pos_display_label" => old["pos_display_label"],
        "authorizer_url"    => old["authorizer_url"],
        "base_version_id"   => old["id"]
      }
      ret, message = Manager::Version.create(parameters)
      if ret == 201
        puts "Application successfully created"
      else
        puts message
      end
    end

    def self.app(name)
      application = Manager::Application.all.find do |application|
        (application["app"]["name"] == name) || (application["app"]["name"] == xml2posxml(name))
      end
      application["app"] if application
    end

    def self.posxml2xml(str)
      str.sub(".posxml", ".xml")
    end

    def self.xml2posxml(str)
      str.sub(".xml", ".posxml")
    end

    def self.show_list(versions)
      if versions && ! versions.empty?
        puts "Versions"

        versions.each do |version|
          puts "#{version["app_version"]["number"]} - #{version["app_version"]["crc"]}"
        end
      end
    end

    def self.check_posxml_app(app)
      if app
        if app.include?(".posxml") || app.include?(".xml")
          app
        else
          app + ".xml"
        end
      else
        if Cloudwalk::App.cwfile_lock
          Cloudwalk::App.cwfile_lock.first["name"]
        else
          puts "Cwfile.json and/or Cwfile.json.lock not found\n"
        end
      end
    end

    def self.help
      puts "cloudwalk release [commands] [arguments]"
      puts " list <app>             : Show all versions based in application argument"
      puts " promote <app> <ver>    : Promote version setting as released, example: promote 1.0.0"
      puts " new <app> <old>..<new> : Create new version based in a existent one, example: new application.posxml 1.0.0..1.1.0"
    end
  end
end
