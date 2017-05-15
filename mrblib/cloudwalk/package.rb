module Cloudwalk
  class Package
    DA_FUNK_FILES       = %w(cloudwalk_handshake da_funk funky-emv funky-simplehttp funky-tlv posxml_parser)
    DA_FUNK_ZIP         = "da_funk.zip"
    TMP_PATH        = "tmp"
    TMP_MAIN_PATH   = "tmp/main"
    TMP_SHARED_PATH = "tmp/shared"

    def self.run(*args)
      if Manager::User.logged?
        if check_parameters(args) && self.device_exists? && Util::DaFunkRuntime.setup
          if self.ingenico?
            self.ingenico
          elsif self.verifone?
            self.verifone
          elsif self.pax? || self.gertec?
            self.mruby
          else
            puts "BRAND #{Util::ENV["BRAND"]} not supported yet."
          end
        end
      else
        puts "User must be logged, execute: \"cloudwalk login\""
      end
    end

    def self.device_exists?
      return true
      devices = Manager::Device.all.select do |json|
        json["device"]["serial_number"] == self.serial_number
      end

      if devices.empty?
        puts "Device dont exists in this account."
      else
        true
      end
    end

    def self.ingenico
      if self.download
        Util::IngenicoPackage.build
      end
    end

    def self.verifone
      if self.download
        Util::VerifonePackage.build
      end
    end

    def self.mruby
      if self.download
        Util::MrubyPackage.build
      end
    end

    private
    def self.download
      self.setup_tmp_dir
      self.setup_platform

      Device::ParamsDat.download
      Device::ParamsDat.update_apps
      PosxmlParser::PosxmlSetting.numerodestepos
    end

    def self.setup_tmp_dir
      if Dir.exists?(TMP_PATH)
        if Dir.exists?(TMP_SHARED_PATH)
          Util::FileTool.clean_dir(TMP_SHARED_PATH)
        else
          Dir.mkdir(TMP_SHARED_PATH)
        end

        if Dir.exists?(TMP_MAIN_PATH)
          Util::FileTool.clean_dir(TMP_MAIN_PATH)
        else
          Dir.mkdir(TMP_MAIN_PATH)
        end
      else
        Dir.mkdir(TMP_PATH)
        Dir.mkdir(TMP_MAIN_PATH)
        Dir.mkdir(TMP_SHARED_PATH)
      end
      Dir.chdir(TMP_PATH)
    end

    def self.setup_platform
      if Cloudwalk::Config.environment == "staging"
        Device::Setting.to_production!
        Device::Setting.to_staging!
      end
      Device::Setting.network_configured  = "1"
      Device::Setting.media               = "wifi"
      Device::System.klass                = "package"
      Device::Setting.logical_number      = self.logical_number
      CliPlatform::System.serial  = self.serial_number
      CliPlatform::System.brand   = self.brand
      CliPlatform::System.model   = self.model
      CliPlatform::System.battery = 0

      Device.adapter ||= CliPlatform
      CliPlatform.setup

      old_wd = Dir.getwd
      Dir.chdir Cloudwalk::Config.dir_path
      I18n.configure("da_funk", "en")
      Dir.chdir "#{old_wd}/tmp"
    end

    def self.ingenico?
      Util::ENV["BRAND"].to_s.downcase == "ingenico"
    end

    def self.verifone?
      Util::ENV["BRAND"].to_s.downcase == "verifone"
    end

    def self.pax?
      Util::ENV["BRAND"].to_s.downcase == "pax"
    end

    def self.gertec?
      Util::ENV["BRAND"].to_s.downcase == "gertec"
    end

    def self.model
      Util::ENV["MODEL"]
    end

    def self.brand
      Util::ENV["BRAND"]
    end

    def self.logical_number
      Util::ENV["LOGICAL_NUMBER"]
    end

    def self.serial_number
      Util::ENV["SERIAL_NUMBER"]
    end

    def self.valid_parameters?
      if logical_check = self.logical_number.to_s.empty?
        puts "Logical Number must be send, e.g.: cloudwalk package LOGICAL_NUMBER=10009" 
      end

      if serial_check = self.serial_number.to_s.empty?
        puts "Serial Number must be send, e.g.: cloudwalk package SERIAL_NUMBER=12341243"
      end

      if model_check = self.model.to_s.empty?
        puts "Model must be send, e.g.: cloudwalk package MODEL=vx680"
      end

      if brand_check = self.brand.to_s.empty?
        puts "Brand must be send, e.g.: cloudwalk package BRAND=verifone"
      end
      ! logical_check && ! serial_check && ! model_check && ! brand_check
    end

    def self.check_parameters(args)
      args.each do |arg|
        key, value = arg.split("=")
        Util::ENV.env[key] = value
      end

      self.valid_parameters?
    end
  end
end

