module Cloudwalk
  class Config
    def self.token
      @token ||= `cloudwalk config token`.chomp
      raise ManagerException.new("Token not found, try 'cloudwalk login'") if @token.empty?
      @token
    end

    def self.host
      @host ||= `cloudwalk config host`.chomp
      raise ManagerException.new("Host not found, try 'cloudwalk login'") if @host.empty?
      @host
    end
  end
end

