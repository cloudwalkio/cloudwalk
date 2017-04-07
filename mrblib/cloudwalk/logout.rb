module Cloudwalk
  class Logout
    def self.run
      if Manager::User.logged?
        puts "Successfully logged out!" if Manager::User.logout
      else
        puts "User not looged in."
      end
    end
  end
end
