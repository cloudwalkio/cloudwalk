module Util
  class FileTool
    def self.clean_dir(dir)
      if Dir.exist?(dir)
        files = Dir.entries(dir)
        files.each do |file|
          next if (file == ".." || file == ".")
          if File.file?("#{dir}/#{file}")
            File.delete("#{dir}/#{file}")
          else
            Dir.delete("#{dir}/#{file}")
          end
        end
      end
    end

    def self.copy(from, to)
      ret = false
      File.open(to, "w") do |file_to|
        File.open(from, "r") do |file|
          loop do
            break(ret) unless buf = file.read(1000)
            file_to.write(buf)
            ret = true
          end
        end
      end
    end
  end
end

