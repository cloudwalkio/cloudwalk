module Cloudwalk
  module Posxml
    class PosxmlVersion
      include Cloudwalk::ManagerHelper

      def self.get_or_create(app, version)
        response = JSON.parse(Net::HTTP.get(URI("#{self.host}/v1/apps/posxml/#{app_id}/versions?access_token=#{self.token}&per_page=100")))
        raise ManagerException.new(response["message"]) if response["message"]

        #TODO
        #`curl -X GET "https://api-staging.cloudwalk.io/v1/apps/posxml/3082/versions?access_token=#{self.token}`
      end

      def self.all(app_id)
        response = JSON.parse(Net::HTTP.get(URI("#{self.host}/v1/apps/posxml/#{app_id}/versions?access_token=#{self.token}&per_page=100")))
        raise ManagerException.new(response["message"]) if response["message"]

        total_pages = response["pagination"]["total_pages"].to_i
        versions = response["appversions"]

        (total_pages - 1).times do |page|
          url = "#{self.host}/v1/apps/posxml/#{app_id}/versions?access_token=#{self.token}&per_page=100&page=#{page+2}"
          response = JSON.parse(Net::HTTP.get(URI(url)))
          raise ManagerException.new(response["message"]) if response["message"]

          versions.concat(response["posxmlapps"])
        end
        versions
      end

      def self.get(app_id, id)
        url = "#{self.host}/v1/apps/posxml/#{app_id}/versions/#{id}?access_token=#{token}"
        response = JSON.parse(Net::HTTP.get(URI(url)))
        raise ManagerException.new(response["message"]) if response["message"]

        response
      end

      def self.update(app_id, version_id, bytecode, app_parameters = nil)
        url      = "#{self.host}/v1/apps/posxml/#{app_id}/versions/#{version_id}?access_token=#{self.token}"
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

