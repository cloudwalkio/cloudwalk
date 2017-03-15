def __main__(argv)
  case argv[1]
  when "version"
    puts "v#{Cloudwalk::VERSION}"
  when "new"
    Cloudwalk::Setup.run(argv[2])
  when "help"
    Cloudwalk::Helper.run
  when "compile"
    Cloudwalk::Mruby.compile(*argv[2..-1])
  when "run"
    Cloudwalk::Mruby.run(*argv[2..-1])
  when "console"
    Cloudwalk::Mruby.console
  else
    Cloudwalk::Helper.run
  end
end
