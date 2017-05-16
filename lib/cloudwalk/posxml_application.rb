module Cloudwalk
  class PosxmlApplication
    def self.token
      Cloudwalk::Config.token
    end

    def self.host
      Cloudwalk::Config.host
    end

    def self.all
      if @apps
        @apps
      else
        response = JSON.parse(Net::HTTP.get(URI("https://#{self.host}/v1/apps/posxml?access_token=#{self.token}&per_page=100")))
        raise ManagerException.new(response["message"]) if response["message"]

        total_pages = response["pagination"]["total_pages"].to_i
        apps = response["posxmlapps"]
        (total_pages - 1).times do |page|
          url = "https://#{self.host}/v1/apps/posxml?access_token=#{self.token}&per_page=100&page=#{page+2}"
          response = JSON.parse(Net::HTTP.get(URI(url)))
          raise ManagerException.new(response["message"]) if response["message"]

          apps.concat(response["posxmlapps"])
        end
        @apps = apps
      end
    end

    def self.get(id)
      url = "https://#{self.host}/v1/apps/posxml/#{id}?access_token=#{self.token}"
      response = JSON.parse(Net::HTTP.get(URI(url)))
      raise ManagerException.new(response["message"]) if response["message"]

      response["posxml_app"]
    end

    def self.get_name(id)
      get(id)["name"]
    end
  end
end

