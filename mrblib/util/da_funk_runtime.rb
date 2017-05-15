module Util
  class DaFunkRuntime
    DA_FUNK_FILES       = %w(cloudwalk_handshake da_funk funky-emv funky-simplehttp funky-tlv posxml_parser)
    DA_FUNK_ZIP         = "da_funk.zip"

    def self.setup
      Cloudwalk.da_funk_zip
      if File.exists?(self.da_funk_zip_path)
        if Dir.exists?(self.da_funk_path)
          Util::FileTool.clean_dir(self.da_funk_path)
        else
          Dir.mkdir(self.da_funk_path)
        end
        old_wd = Dir.getwd
        Dir.chdir Cloudwalk::Config.dir_path
        if true #Miniz.unzip("da_funk.zip", "./")
          Dir.chdir old_wd
          begin
            $LOAD_PATH << self.da_funk_path
            DA_FUNK_FILES.collect { |file| require(file) }
            return true
          rescue => e
            puts "ERROR: #{e.message}"
            puts "#{e.backtrace.join("\n")}"
          end
        end
      end
      puts "Problem to setup."
    end

    def self.da_funk_path
      "#{Cloudwalk::Config.dir_path}/da_funk"
    end

    def self.da_funk_zip_path
      "#{Cloudwalk::Config.dir_path}/#{DA_FUNK_ZIP}"
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
  end
end

