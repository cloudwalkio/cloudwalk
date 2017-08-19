module Cloudwalk
  module ManagerHelper
    def self.included(base)
      base.extend(self)
    end

    def token
      Cloudwalk::Config.token
    end

    def host
      Cloudwalk::Config.host
    end

    def posxml2xml(str)
      str.sub(".posxml", ".xml")
    end

    def xml2posxml(str)
      str.sub(".xml", ".posxml")
    end
  end
end

