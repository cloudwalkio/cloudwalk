module Cloudwalk
  class New
    class << self
      attr_accessor :name, :language
    end

    def self.run(*args)
      if Manager::User.logged?
        posxml = args.delete("-xml")
        self.name = args.first

        if check_parameters(args)
          if posxml
            if cwfile = Manager::Application.create(self.name, self.pos_display_label,
                                                    self.description, self.displayable,
                                                    self.authorizer_url)
              Util::PosxmlNew.run(name, cwfile)
            end
          else
            if cwfile = Manager::RubyApplication.create(self.name, self.pos_display_label,
                                                    self.description, self.displayable,
                                                    self.authorizer_url)
              Util::MrubyNew.run(name, cwfile)
            end
          end
        end
      else
        puts "User must login, execute: \"cloudwalk login\""
      end
    end

    def self.check_parameters(args)
      args.each do |arg|
        key, value = arg.split("=")
        Util::ENV.env[key] = value
      end
    end

    def self.pos_display_label
      Util::ENV["POS_DISPLAY_LABEL"] || "X"
    end

    def self.description
      Util::ENV["DESCRIPTION"] || self.name
    end

    def self.displayable
      Util::ENV["DISPLAYABLE"] || self.pos_display_label != "X"
    end

    def self.authorizer_url
      Util::ENV["AUTHORIZER_URL"] || "https://myhost.com"
    end
  end
end
