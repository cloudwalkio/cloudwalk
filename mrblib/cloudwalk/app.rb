module Cloudwalk
  class App
    CW_FILE_PATH      = "./Cwfile.json"
    CW_FILE_LOCK_PATH = "./Cwfile.json.lock"
    COMMANDS          = [
      "list",
      "new",
      "delete"
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
      when "delete"
        Cloudwalk::App.delete(self.application)
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

    def self.delete(application)
      type, app = self.find(application)
      if app && type == :ruby
        app_name = Util.ask("READ THIS:\nThis action will permanently delete the application #{application}, and can only be concluded if you delete all associations (groups, modules and etc) with the application.\nPlease type in the name of the application to confirm:")
        if app_name == application
          ret, err = Manager::RubyApplication.delete(app)
          if ret && !err
            puts "Success!"
          else
            puts err
          end
        else
          puts "Wrong application name!!"
        end
      else
        puts "Application #{application} not found"
      end
    end

    def self.help
      puts "cloudwalk app [arguments]"
      puts " list          : Show applications to the current account"
      puts " new <name>    : Create new application based like cloudwalk new"
      puts " delete <name> : Delete ruby application"
    end

    def self.find(application)
      if application.include?(".posxml") || application.include?(".xml")
        [:posxml, Manager::Application.find(application)]
      else
        [:ruby, Manager::RubyApplication.find(application)]
      end
    end

    def self.cwfile
      unless @cwfile
        if File.exists?(CW_FILE_PATH)
          txt = File.read(CW_FILE_PATH)
          if ! txt.empty?
            @cwfile = JSON.parse(txt)
          else
            puts "Cwfile.json empty!"
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

