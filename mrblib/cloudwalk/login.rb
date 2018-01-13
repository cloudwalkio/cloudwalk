module Cloudwalk
  class Login
    def self.run
      if Manager::User.logged?
        puts "User already looged."
      else
        email, pass = self.ask_email, self.ask_password
        companies, err = Manager::User.login(email, pass)
        if companies
          Manager::User.setup(email, companies, self.select_company(companies))
          puts "Logged with success!"
        else
          puts "Problem to login: #{err}"
        end
      end
    end

    def self.ask_email
      Util.ask "Enter your e-mail: "
    end

    def self.ask_password
      Util.ask_secret "Enter your password: "
    end

    def self.input_company(companies)
      if companies.size == 1
        companies.first
      else
        puts "Select Company:"
        options = companies.each_with_index.inject({}) do |hash, company|
          i = company[1]
          hash[i] = company[0]
          puts "#{i} - #{company[0]["company_name"]}"
          hash
        end
        key = gets.chomp
        options[key.to_i] unless key.empty?
      end
    end

    def self.select_company(companies)
      loop do
        company = self.input_company(companies)
        break(company) if company
      end
    end
  end
end

