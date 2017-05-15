module Util
  class MrubyPackage
    FILES_NOT_MOVE = %w(.. .)
    DIR_MAIN   = "main"
    DIR_SHARED = "shared"

    def self.build
      dir = "./#{Util::ENV["BRAND"]}"
      setup_dir(dir)
      main_files   = search_map(DIR_MAIN, (FILES_NOT_MOVE << "config.dat"))
      shared_files = search_map(DIR_SHARED, FILES_NOT_MOVE)

      main_files.each do |file|
        Util::FileTool.copy("#{DIR_MAIN}/#{file}", "#{dir}/#{DIR_MAIN}/#{file}")
      end

      shared_files.each do |file|
        Util::FileTool.copy("#{DIR_SHARED}/#{file}", "#{dir}/#{DIR_SHARED}/#{file}")
      end
    end

    def self.setup_dir(dir)
      if Dir.exists?(dir)
        Util::FileTool.clean_dir(dir)
      else
        Dir.mkdir(dir)
      end
      Dir.mkdir("#{dir}/#{DIR_MAIN}")
      Dir.mkdir("#{dir}/#{DIR_SHARED}")
    end

    def self.search_map(path, exclude)
      Dir.entries(path).select {|f| ! exclude.include?(f) }
    end
  end
end

