module Manager
  class Application
    def self.all
      url = "#{Cloudwalk::Config.host}/v1/apps/posxml?access_token=#{self.token}&per_page=100"
      response = Util::CloudwalkHttp.get(url, {})
      if response.code == 200
        json = JSON.parse(response.body)
        total_pages = json["pagination"]["total_pages"].to_i
        apps = json["posxmlapps"]

        (total_pages - 1).times do |page|
          url = "#{Cloudwalk::Config.host}/v1/apps/posxml?access_token=#{self.token}&per_page=100&page=#{page+2}"
          response = Util::CloudwalkHttp.get(url, {})
          if response.code == 200
            apps.concat(JSON.parse(response.body)["posxmlapps"])
          end
        end
      end
      apps || []
    end

    def self.token
      Cloudwalk::Config.token
    end
  end
end

