module Cloudwalk
  class ApplicationVersion
    include Cloudwalk::ManagerHelper

    def self.get_or_create(app, version)
      response = JSON.parse(Net::HTTP.get(URI("#{self.host}/v1/apps/#{app_id}/versions?access_token=#{self.token}&per_page=100")))
      raise ManagerException.new(response["message"]) if response["message"]

      #TODO
      #`curl -X GET "https://api-staging.cloudwalk.io/v1/apps/posxml/3082/versions?access_token=#{self.token}`
    end

    def self.all(app_id)
      response = JSON.parse(Net::HTTP.get(URI("#{self.host}/v1/apps/#{app_id}/versions?access_token=#{self.token}&per_page=100")))
      raise ManagerException.new(response["message"]) if response["message"]

      total_pages = response["pagination"]["total_pages"].to_i
      versions = response["appversions"]

      (total_pages - 1).times do |page|
        url = "#{self.host}/v1/apps/#{app_id}/versions?access_token=#{self.token}&per_page=100&page=#{page+2}"
        response = JSON.parse(Net::HTTP.get(URI(url)))
        raise ManagerException.new(response["message"]) if response["message"]

        versions.concat(response["appversions"])
      end
      versions
    end

    def self.get(app_id, id)
      url = "#{self.host}/v1/apps/#{app_id}/versions/#{id}?access_token=#{token}"
      response = JSON.parse(Net::HTTP.get(URI(url)))
      if response["message"]
        raise ManagerException.new(response["message"])
      else
        response["app_version"]
      end
    end


    # NEW
    def self.find(app_name, version_name)
      applications = Cloudwalk::Application.all
      application   = applications.find { |app_json| app_json["name"] == xml2posxml(app_name) }
      versions     = Cloudwalk::ApplicationVersion.all(application["id"])
      version      = versions.find { |json| json["app_version"]["number"] == version_name }

      [application, (version && version["app_version"])]
    end

    # NEW B4
    def self.update(app_id, version_id, bytecode, app_parameters = nil)
      url    = "#{self.host}/v1/apps/#{app_id}/versions?access_token=#{self.token}"
      uri      = URI(url)
      form     = {"bytecode" => Base64.strict_encode64(bytecode)}
      response = nil

      if app_parameters
        form["authorizer_url"]    = app_parameters["authorizer_url"]
        form["number"]            = app_parameters["version"]
        form["displayable"]       = app_parameters["displayable"]
        form["pos_display_label"] = app_parameters["pos_display_label"]
      end

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        request = Net::HTTP::Post.new(uri)
        request.set_form_data(form)
        response = http.request(request)
      end
      [response.code.to_i == 201, response]
    end
  end
end

