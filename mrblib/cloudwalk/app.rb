module Cloudwalk
  class App
    CW_FILE_PATH      = "./Cwfile.json"
    CW_FILE_LOCK_PATH = "./Cwfile.json.lock"
    COMMANDS          = [
      "list",
      "new"
    ]

    class << self
      attr_accessor :command, :application
    end

    def self.run(*args)
      if Manager::User.logged?
        self.command     = args.shift
        self.application = args.shift
        self.execute(args)
      else
        puts "User must be logged, execute: \"cloudwalk login\""
      end
    end

    def self.execute(args)
      case command
      when "list"
        Cloudwalk::App.list
      when "new"
        Cloudwalk::New.run(self.application || "")
      else
        self.help
      end
    end

    def self.list
      apps = Manager::RubyApplication.all
      unless apps.empty?
        puts "Ruby Applications"
        apps.each do |app|
          puts "#{app["ruby_app"]["name"]} - #{app["ruby_app"]["description"]}"
        end
      end

      apps = Manager::Application.all
      unless apps.empty?
        puts "Posxml Applications"
        apps.each do |app|
          puts "#{app["posxml_app"]["name"]} - #{app["posxml_app"]["description"]}"
        end
      end
    end

    def self.help
      puts "cloudwalk app [arguments]"
      puts " list       : Show applications to the current account"
      puts " new <name> : Create new application based like cloudwalk new"
    end

    def self.cwfile
      unless @cwfile
        if File.exists?(CW_FILE_PATH)
          txt = File.read(CW_FILE_PATH)
          if ! txt.empty?
            @cwfile = JSON.parse(txt)
          else
            puts "deu ruim"
          end
        end
      end
    end

    def self.cwfile_lock
      unless @cwfile_lock
        if File.exists?(CW_FILE_LOCK_PATH)
          txt = File.read(CW_FILE_LOCK_PATH)
          if ! txt.empty?
            @cwfile_lock = JSON.parse(txt)
          end
        end
      end
    end
  end
end

