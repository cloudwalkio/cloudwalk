module Cloudwalk
  class New
    def self.run(*args)
      if Manager::User.logged?
        posxml = args.delete("--posxml")
        name   = args.first
        if posxml
          Util::PosxmlNew.run(name)
        else
          Util::MrubyNew.run(name)
        end
      else
        puts "User must login, execute: \"cloudwalk login\""
      end
    end
  end
end
