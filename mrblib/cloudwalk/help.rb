module Cloudwalk
  class Help
    def self.run
      puts "cloudwalk [switches] [arguments]"
      puts "cloudwalk help                                   : show this message"
      puts "cloudwalk login                                  : perform cloudwalk.io authentication"
      puts "cloudwalk logout                                 : perform cloudwalk.io logoff"
      puts "cloudwalk new <name>                             : create app, with: -xml to xml app"
      puts "cloudwalk compile -o<out> <file1> <file2>        : compile ruby to mrb"
      puts "cloudwalk app upgrade-version <name> <old>..<new>: create a new version for xml app"
      puts "cloudwalk console                                : mirb console"
      puts "cloudwalk run -b <out>, <file1>                  : run ruby or binary file"
      puts "cloudwalk package <parameters>                   : Create package based in the params: MODEL, BRAND, SERIAL_NUMBER, LOGICAL_NUMBER; ie: DEVICE=d200"
      puts "cloudwalk config <parameter>                     : print config parameters (token, user_id, env, host)"
      puts "cloudwalk about                                  : print cloudwalk cli about"
      puts "cloudwalk version                                : print cloudwalk version"
    end
  end
end
