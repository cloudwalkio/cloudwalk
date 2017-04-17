module Util
  class IngenicoPackage
    DIR_MAIN       = "./main"
    DIR_SHARED     = "./shared"
    FILES_EXCLUDED = %w(Messages_ctls.txt Messages.txt .. .)
    FILES_NOT_MOVE = %w(.. .)
    DIR_HOST       = "./TELIUM/WALK/HOST"
    DIR_WALK       = "./TELIUM/WALK"
    DIR_TELUM      = "./TELIUM"

    def self.build
      self.setup_dir
      # TODO Add flag for it
      main_files   = search_map(DIR_MAIN, (FILES_EXCLUDED << "config.dat"))
      shared_files = search_map(DIR_SHARED, FILES_EXCLUDED)

      main_files.each do |file, hashname|
        Util::FileTool.copy("#{DIR_MAIN}/#{file}", "#{DIR_HOST}/f#{hashname}")
      end
      shared_files.each do |file, hashname|
        Util::FileTool.copy("#{DIR_SHARED}/#{file}", "#{DIR_HOST}/f#{hashname}")
      end
    end

    def self.setup_dir
      if Dir.exists?(DIR_HOST)
        Util::FileTool.clean_dir(DIR_HOST)
      else
        Dir.mkdir(DIR_TELUM)
        Dir.mkdir(DIR_WALK)
        Dir.mkdir(DIR_HOST)
      end
    end

    def self.search_map(path, exclude)
      dir_entries(path, exclude).inject({}) do |hash, f|
        hash[f] = Util::Hashname.calc_hashname(f)
        hash
      end
    end

    def self.dir_entries(path, exclude = [])
      Dir.entries(path).select {|f| ! exclude.include?(f) }
    end
  end
end

