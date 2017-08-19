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
  end
end
