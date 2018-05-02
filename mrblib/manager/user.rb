module Manager
  class User

    # curl -X POST "https://api-staging.cloudwalk.io/v1/users/token" -d '{"email":"thiago@cloudwalk.io","password":"PASSWORD"}'
    # [
    #   {"company_name":"CloudWalk Scalone","company_id":491,"user_id":552,"api_token":"TOKEN","logs_channel":
    #     "{\"company\":\"TOKEN\",\"channel\":\"TOKEN\"}"},
    #   {"company_name":"CloudWalk","company_id":2,"user_id":552,"api_token":"TOKEN","logs_channel":
    #     "{\"company\":\"TOKEN\",\"channel\":\"TOKEN\"}"}
    # ]
    def self.login(email, password)
      body = JSON.stringify({"email" => email, "password" => password}).gsub("+", "%2B")
      options = {"Body" => body, "Content-Type" => "application/x-www-form-urlencoded"}
      response = Util::CloudwalkHttp.post("#{Cloudwalk::Config.host}/v1/users/token", options)
      if response.code == 200
        [JSON.parse(response.body), nil]
      else
        [false, response.body]
      end
    end

    def self.logout
      Cloudwalk::Config.clean!
    end

    def self.logged?
      !! Cloudwalk::Config.token
    end

    def self.setup(email, companies, company)
      if company["logs_channel"].is_a? String
        company["logs_channel"] = JSON.parse(company["logs_channel"])
      end

      token       = company["api_token"]
      log_company = company["logs_channel"]["company"]
      log_channel = company["logs_channel"]["channel"]

      params = {
        "companies"   => companies,
        "company"     => company,
        "email"       => email,
        "token"       => token,
        "log_company" => log_company,
        "log_channel" => log_channel,
        "user_id"     => company["user_id"]
      }
      Cloudwalk::Config.update_attributes(params)
    end

    def self.sign_up(name, email, password)
      body = JSON.stringify({"name" => name, "email" => email, "password" => password}).gsub("+", "%2B")
      options = {"Body" => body, "Content-Type" => "application/x-www-form-urlencoded"}
      response = Util::CloudwalkHttp.post("#{Cloudwalk::Config.host}/v1/users", options)
      if response.code == 201
        [JSON.parse(response.body), nil]
      else
        [false, response.body]
      end
    end
  end
end

