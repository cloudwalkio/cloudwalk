module Manager
  class Version
    def self.all(app_id)
      url = "#{Cloudwalk::Config.host}/v1/apps/#{app_id}/versions?access_token=#{self.token}&per_page=100"
      response = Util::CloudwalkHttp.get(url, {})
      if response.code == 200
        json = JSON.parse(response.body)
        total_pages = json["pagination"]["total_pages"].to_i
        versions = json["appversions"]

        (total_pages - 1).times do |page|
          url = "#{Cloudwalk::Config.host}/v1/apps/#{app_id}/versions?access_token=#{self.token}&per_page=100&page=#{page+2}"
          response = Util::CloudwalkHttp.get(url, {})
          if response.code == 200
            versions.concat(JSON.parse(response.body)["apps"])
          end
        end
      end
      versions || []
    end

    def self.get(id, app_id)
      url = "#{Cloudwalk::Config.host}/v1/apps/#{app_id}/versions/#{id}?access_token=#{self.token}&per_page=100"
      response = Util::CloudwalkHttp.get(url, {})
      if response.code == 200
        JSON.parse(response.body)
      end
    end

    def self.create(parameters)
      url   = "#{Cloudwalk::Config.host}/v1/apps/#{parameters["app_id"]}/versions?access_token=#{self.token}"
      options = {"Body" => JSON.stringify(parameters), "Content-Type" => "application/x-www-form-urlencoded"}
      response = Util::CloudwalkHttp.post(url, options)
      [response.code, response.body]
    end

    def self.token
      Cloudwalk::Config.token
    end
  end
end

