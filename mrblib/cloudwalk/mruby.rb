module Cloudwalk
  class Mruby
    def self.run(*args)
      Cloudwalk.mruby(args.size + 1, args.insert(0, "mruby"))
    end

    def self.compile(*args)
      Cloudwalk.mrbc(args.size + 1, args.insert(0, "mrbc"))
    end

    def self.console(*args)
      path = File.expand_path("./")
      app  = File.basename(path)
      if File.exists?(File.join(path, "out", app, "main.mrb"))
        Dir.chdir("out")
        $LOAD_PATH.unshift "./#{app}"
        require "da_funk"
        require "main"
      end
      Cloudwalk.mirb
    end
  end
end

