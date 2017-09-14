module Cloudwalk
  class SignUp
    def self.run(*args)
      puts "Welcome!"
      puts "You're about to create a new cloudwalk account."
      puts "Please answer the following questions..."

      name  = Util.ask("Your name (optional): ")
      email = Util.ask("Your e-mail: ")
      pass  = Util.ask_secret("Your password: ")
      puts ""
      ret, err = Manager::User.sign_up(name, email, pass)
      if ret
        puts "Success!"
        puts "Please check confirmation e-mail before execute cloudwalk login"
      else
        puts "Problem to sign-up: #{err}"
      end
    end
  end
end

