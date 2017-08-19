module Cloudwalk
  class ManagerException < StandardError
  end

  class Manager
    def self.token
      Cloudwalk::Config.token
    end

    def self.host
      Cloudwalk::Config.host
    end
  end
end
