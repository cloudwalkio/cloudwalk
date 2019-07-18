module Manager
  class Application
    def self.all
      url = "#{Cloudwalk::Config.host}/v1/apps?access_token=#{self.token}&per_page=100"
      response = Util::CloudwalkHttp.get(url, {})
      if response.code == 200
        json = JSON.parse(response.body)
        total_pages = json["pagination"]["total_pages"].to_i
        apps = json["apps"]

        (total_pages - 1).times do |page|
          url = "#{Cloudwalk::Config.host}/v1/apps?access_token=#{self.token}&per_page=100&page=#{page+2}"
          response = Util::CloudwalkHttp.get(url, {})
          if response.code == 200
            apps.concat(JSON.parse(response.body)["apps"])
          end
        end
      end
      apps || []
    end

    def self.find(name)
      name = name.gsub(".posxml", "").gsub(".xml", "")
      application = self.all.find do |app|
        app["posxml_app"]["name"].gsub(".posxml", "") == name
      end
      application["posxml_app"] if application
    end

    def self.delete(app)
      if app || app["id"]
        url = "#{Cloudwalk::Config.host}/v1/apps/#{app["id"]}?access_token=#{self.token}"
        response = Util::CloudwalkHttp.delete(url, {})
        if response.code == 200 || response.code == 204
          [true]
        else
          [false, response.body]
        end
      else
        [false, "Id not found"]
      end
    end

    def self.token
      Cloudwalk::Config.token
    end

    def self.create(name, pos_display_label, description, displayable, authorizer_url, language)
      params = {
        "name"              => name,
        "pos_display_label" => pos_display_label,
        "description"       => description,
        "displayable"       => displayable,
        "authorizer_url"    => authorizer_url,
        "language"          => language
      }

      url  = "#{Cloudwalk::Config.host}/v1/apps?access_token=#{self.token}"
      body = JSON.stringify(params)
      req  = {"Body" => body, "Content-Type" => "application/x-www-form-urlencoded"}

      response = Util::CloudwalkHttp.post(url, req)
      if response.code == 200
        params
      else
        puts response.body
      end
    end
  end
end

