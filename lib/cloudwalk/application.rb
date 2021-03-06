module Cloudwalk
  class Application
    include Cloudwalk::ManagerHelper

    # NEW
    def self.find(name)
      self.all.find do |app|
        app["name"] == name
      end
    end

    def self.all
      if @apps
        @apps
      else
        response = JSON.parse(Net::HTTP.get(URI("#{self.host}/v1/apps?access_token=#{self.token}&per_page=100")))
        raise ManagerException.new(response["message"]) if response["message"]

        total_pages = response["pagination"]["total_pages"].to_i
        @apps = response["apps"].collect {|r| r["app"] }
        (total_pages - 1).times do |page|
          url = "#{self.host}/v1/apps?access_token=#{self.token}&per_page=100&page=#{page+2}"
          response = JSON.parse(Net::HTTP.get(URI(url)))
          raise ManagerException.new(response["message"]) if response["message"]

          @apps.concat(response["apps"].collect {|r| r["app"] })
        end
        @apps
      end
    end

    # BASE

    def self.get(id)
      url = "#{self.host}/v1/apps/#{id}?access_token=#{self.token}"
      response = JSON.parse(Net::HTTP.get(URI(url)))
      raise ManagerException.new(response["message"]) if response["message"]

      response["app"]
    end

    def self.get_name(id)
      get(id)["name"]
    end

    def self.update(app_id, bytecode, app_parameters = nil)
      url      = "#{self.host}/v1/apps/#{app_id}?access_token=#{self.token}"
      uri      = URI(url)
      form     = {"bytecode" => Base64.strict_encode64(bytecode)}
      response = nil

      if app_parameters
        form["authorizer_url"]    = app_parameters["authorizer_url"]
        form["description"]       = app_parameters["description"]
        form["pos_display_label"] = app_parameters["pos_display_label"]
        form["displayable"]       = app_parameters["pos_display_label"] != "X"
      end

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        request = Net::HTTP::Put.new(uri)
        request.set_form_data(form)
        response = http.request(request)
      end
      [response.code.to_i == 200, response]
    end

  end
end
