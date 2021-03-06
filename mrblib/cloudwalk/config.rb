module Cloudwalk
  class Config
    class << self
      attr_accessor :parameters
    end

    API         = "https://manager.cloudwalk.io"
    API_STAGING = "https://manager-staging.cloudwalk.io"

    PARAMETERS_DEFAULT = {
      "companies"   => nil,
      "company"     => nil,
      "email"       => nil,
      "token"       => nil,
      "log_company" => nil,
      "log_channel" => nil,
      "user_id"     => nil
    }
    self.parameters = PARAMETERS_DEFAULT

    def self.run(*args)
      case args.first
      when "user_id"
        puts self.user_id
      when "token"
        puts self.token
      when "env"
        puts self.environment
      when "host"
        puts self.host
      else
        puts "Parameter #{args.first} not found, try token, user_id, env, host"
      end
    end

    def self.dir_path
      "#{Util::ENV["HOME"]}/.cloudwalk"
    end

    def self.file_path
      "#{self.dir_path}/config_#{self.environment}.json"
    end

    def self.environment
      if Util::ENV["CLOUDWALK_ENV"] == "staging"
        "staging"
      else
        "production"
      end
    end

    def self.user_id
      self.parameters["user_id"]
    end

    def self.token
      self.parameters["token"]
    end

    def self.companies
      self.parameters["companies"]
    end

    def self.company
      self.parameters["company"]
    end

    def self.email
      self.parameters["email"]
    end

    def self.log_company
      self.parameters["log_company"]
    end

    def self.log_channel
      self.parameters["log_channel"]
    end

    def self.host
      if self.environment == "staging"
        API_STAGING
      else
        API
      end
    end

    def self.validate_structure
      unless File.directory?(self.dir_path)
        Dir.mkdir(self.dir_path)
      end
    end

    def self.file_exists?
      self.validate_structure
      File.exists?(self.file_path)
    end

    def self.load
      if self.file_exists?
        self.parameters.merge!(JSON.parse(File.read(self.file_path)))
      end
    end

    def self.persist!
      self.validate_structure
      txt = JSON.stringify(self.parameters)
      File.open(self.file_path, "w") { |file| file.write(txt) }
      true
    end

    def self.clean!
      if self.file_exists?
        File.delete(self.file_path)
        true
      else
        false
      end
    end

    def self.update_attributes(params)
      self.parameters.merge!(params)
      self.persist!
    end
  end
end

