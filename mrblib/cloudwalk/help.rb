module Cloudwalk
  class Help
    def self.run
      puts "cloudwalk [switches] [arguments]"
      puts "cloudwalk help                            : show this message"
      puts "cloudwalk login                           : perform cloudwalk.io authentication"
      puts "cloudwalk logout                          : perform cloudwalk.io logoff"
      puts "cloudwalk new <name>                      : create app"
      puts "cloudwalk compile -o<out> <file1> <file2> : compile ruby to mrb"
      puts "cloudwalk console                         : mirb console"
      puts "cloudwalk run -b <out>, <file1>           : run ruby or binary file"
      puts "cloudwalk about                           : print cloudwalk cli about"
      puts "cloudwalk version                         : print cloudwalk version"
    end
  end
end
