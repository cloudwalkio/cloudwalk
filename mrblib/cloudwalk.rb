def __main__(argv)
  Util::ENV.load
  Cloudwalk::Config.load
  case argv[1]
  when "version"
    puts "v#{Cloudwalk::VERSION}"
  when "new"
    Cloudwalk::New.run(*argv[2..-1])
  when "help"
    Cloudwalk::Help.run
  when "compile"
    Cloudwalk::Compile.run(*argv[2..-1])
  when "run"
    Cloudwalk::Mruby.run(*argv[2..-1])
  when "console"
    Cloudwalk::Mruby.console
  when "about"
    Cloudwalk::About.run
  when "sign-up"
    Cloudwalk::SignUp.run
  when "login"
    Cloudwalk::Login.run
  when "logout"
    Cloudwalk::Logout.run
  when "config"
    Cloudwalk::Config.run(*argv[2..-1])
  when "app"
    Cloudwalk::App.run(*argv[2..-1])
  when "package"
    Cloudwalk::Package.run(*argv[2..-1])
  else
    Cloudwalk::Help.run
  end
end

