module Cloudwalk
  class Help
    def self.run
      puts "cloudwalk [command] [arguments]"
      puts "cloudwalk help                                   : show this message"
      puts "cloudwalk sign-up                                : perform sign-up process"
      puts "cloudwalk login                                  : perform cloudwalk.io authentication"
      puts "cloudwalk logout                                 : perform cloudwalk.io logoff"
      puts "cloudwalk new <name>                             : create app, with: -xml to xml app"
      puts "cloudwalk compile -o<out> <file1> <file2>        : compile ruby to mrb, posxml(-xml), xml2rb(-txml)"
      puts "cloudwalk run -b <out>, <file1>                  : run ruby or binary file"
      puts "cloudwalk app                                    : arguments list or new"
      puts "cloudwalk console                                : mirb console"
      puts "cloudwalk release <argument>                     : manipulate releases based in Cwfile.json"
      puts "cloudwalk package <arguments>                    : create package based in the params: MODEL, BRAND, SERIAL_NUMBER, LOGICAL_NUMBER; ie: DEVICE=d200"
      puts "cloudwalk config <argument>                      : print config parameters (token, user_id, env, host)"
      puts "cloudwalk about                                  : print cloudwalk cli about"
      puts "cloudwalk version                                : print cloudwalk version"
    end
  end
end
