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

    def self.find(name)
      name = name.gsub(".posxml", "").gsub(".xml", "")
      application = self.all.find do |app|
        app["posxml_app"]["name"].gsub(".posxml", "") == name
      end
      application["posxml_app"] if application
    end

    def self.token
      Cloudwalk::Config.token
    end

    def self.create(name, pos_display_label, description, displayable, authorizer_url)
      params = {
        "name"              => name,
        "pos_display_label" => pos_display_label,
        "description"       => description,
        "displayable"       => displayable,
        "authorizer_url"    => authorizer_url
      }

      url  = "#{Cloudwalk::Config.host}/v1/apps/posxml?access_token=#{self.token}"
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

