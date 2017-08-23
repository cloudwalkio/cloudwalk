module Cloudwalk
  module Ruby
    class RubyApplication < Cloudwalk::Manager
      include Cloudwalk::ManagerHelper

      # NEW
      def self.find(name)
        # [{"id":2381,"name":"icy-star-1","description":null,"created_via":"api","created_at":"2016-09-24T12:24:17.082-03:00"}]
        application = self.all.select do |app|
          app["name"] == name
        end
      end

      def self.all
        if @apps
          @apps
        else
          response = JSON.parse(Net::HTTP.get(URI("#{self.host}/v1/apps/ruby?access_token=#{self.token}&per_page=100")))
          raise ManagerException.new(response["message"]) if response["message"]

          total_pages = response["pagination"]["total_pages"].to_i
          apps = response["rubyapps"]
          (total_pages - 1).times do |page|
            url = "#{self.host}/v1/apps/ruby?access_token=#{self.token}&per_page=100&page=#{page+2}"
            response = JSON.parse(Net::HTTP.get(URI(url)))
            raise ManagerException.new(response["message"]) if response["message"]

            apps.concat(response["ruby_app"])
          end
          @apps = apps
        end
      end

      # BASE

      def self.get(id)
        url = "#{self.host}/v1/apps/ruby/#{id}?access_token=#{self.token}"
        response = JSON.parse(Net::HTTP.get(URI(url)))
        raise ManagerException.new(response["message"]) if response["message"]

        response["ruby_app"]
      end

      def self.get_name(id)
        get(id)["name"]
      end


      def self.update(app_id, bytecode, app_parameters = nil)
        url      = "#{self.host}/v1/apps/ruby/#{app_id}?access_token=#{self.token}"
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
end

