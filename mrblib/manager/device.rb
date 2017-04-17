module Manager
  class Device
    def self.token
      Cloudwalk::Config.token
    end

    def self.all
      url = "#{Cloudwalk::Config.host}/v1/devices?access_token=#{self.token}&per_page=100"
      response = Util::CloudwalkHttp.get(url, {})
      if response.code == 200
        json = JSON.parse(response.body)
        total_pages = json["pagination"]["total_pages"].to_i
        devices = json["devices"]

        (total_pages - 1).times do |page|
          url = "#{Cloudwalk::Config.host}/v1/devices?access_token=#{self.token}&per_page=100&page=#{page+2}"
          response = Util::CloudwalkHttp.get(url, {})
          if response.code == 200
            devices.concat(JSON.parse(response.body)["devices"])
          end
        end
      end
      devices || []
    end
  end
end

