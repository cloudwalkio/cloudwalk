module Cloudwalk
  class Deploy
    # TODO Check CRC
    def self.posxml(outs)
      outs.each do |path|
        posxml   = path.split("/").last
        print "=> Deploying #{posxml}"
        app_lock = self.lock.find {|config| config["name"] == posxml }

        unless app_lock
          self.lock.each do |application|
            app_lock = application["modules"].find {|config| config["name"] == posxml }
            break if app_lock
          end
        end

        unless app_lock
          # TODO Improve!
          raise Exception.new("application or module #{path} not found in Manager, please create it")
        end

        app_cwfile = self.cwfile["apps"].find {|config| config["name"] == posxml2xml(posxml) }

        ret, response = Cloudwalk::PosxmlVersion.update(
          app_lock["id"], app_lock["version_id"], File.read(path), app_cwfile
        )
        if ret
          STDOUT.write("\r=> Success Deployed                               \n")
        else
          STDOUT.write("\r=> Error #{response.code}:#{response.body}\n")
        end
      end
    end

    def self.deploy_mruby(path)
      zip         = path.split("/").last
      application = zip.split(".").first

      print "=> Deploying #{posxml}"
      app_lock = self.lock.find {|config| config["name"] == application }

      unless app_lock
        # TODO Improve!
        raise Exception.new("application or module #{path} not found in Manager, please create it")
      end

      app_cwfile = self.cwfile["apps"].find {|config| config["name"] == application }

      ret, response = Cloudwalk::RubyApplication.update(
        app_lock["id"], File.read(path), app_cwfile
      )
      if ret
        STDOUT.write("\r=> Success Deployed                               \n")
      else
        STDOUT.write("\r=> Error #{response.code}:#{response.body}\n")
      end
    end


  end
end
