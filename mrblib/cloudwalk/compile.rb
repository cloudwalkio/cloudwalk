module Cloudwalk
  class Compile
    def self.run(*args)
      # TODO check errors
      if args.delete("-txml")
        unless args.delete("-o")
          args[0] = args[0][2..-1] if args.first[0..2] == "-o"
        end
        Util::Posxml.translate(args.last, args.first)
      elsif args.delete("-xml") || args.last.include?(".xml")
        unless args.delete("-o")
          args[0] = args[0][2..-1] if args.first[0..2] == "-o"
        end
        Util::Posxml.compile(args.last, args.first)
      else
        Cloudwalk::Mruby.compile(*args)
      end
    end
  end
end

