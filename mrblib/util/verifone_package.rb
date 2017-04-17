module Util
  class VerifonePackage
    DIR_VERIFONE   = "./VERIFONE"
    DIR_1          = "./VERIFONE/1"
    FILES_NOT_MOVE = %w(.. .)
    DIR_MAIN       = "./main"
    DIR_SHARED     = "./shared"

    def self.build
      self.setup_dir
      main_files   = search_map(DIR_MAIN, (FILES_NOT_MOVE << "config.dat"))
      shared_files = search_map(DIR_SHARED, FILES_NOT_MOVE)

      main_files.each do |file|
        Util::FileTool.copy("#{DIR_MAIN}/#{file}", "#{DIR_1}/#{file}")
      end

      shared_files.each do |file|
        Util::FileTool.copy("#{DIR_SHARED}/#{file}", "#{DIR_1}/#{file}")
      end
    end

    def self.setup_dir
      if Dir.exists?(DIR_1)
        Util::FileTool.clean_dir(DIR_1)
      else
        Dir.mkdir(DIR_VERIFONE)
        Dir.mkdir(DIR_1)
      end
    end

    def self.search_map(path, exclude)
      Dir.entries(path).select {|f| ! exclude.include?(f) }
    end
  end
end
