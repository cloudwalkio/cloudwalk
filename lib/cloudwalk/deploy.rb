module Cloudwalk
  class Deploy
    include Cloudwalk::ManagerHelper

    attr_accessor :cwfile, :lock

    def initialize(cwfile, lock)
      @cwfile = cwfile
      @lock   = lock
    end

    # TODO Check CRC
    def posxml(outs)
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
          raise Cloudwalk::DeployException.new("application or module #{path} not found in Manager, please create it")
        end

        app_cwfile = self.cwfile["apps"].find {|config| config["name"] == posxml2xml(posxml) }

        ret, response = Cloudwalk::Posxml::PosxmlVersion.update(
          app_lock["id"], app_lock["version_id"], File.read(path), app_cwfile
        )
        if ret
          STDOUT.write("\r=> Success Deployed                               \n")
        else
          STDOUT.write("\r=> Error #{response.code}:#{response.body}\n")
        end
      end
    end

    def name
      self.cwfile["apps"].first["name"]
    end

    def ruby
      zip = "out/#{self.name}.zip"
      if File.exists? zip
        print "=> Deploying #{self.name}"

        app_lock = self.lock.find {|config| config["name"] == self.name }

        unless app_lock
          # TODO Improve!
          raise Cloudwalk::DeployException.new("application #{self.name} not found at Manager, please create it")
        end

        ret, response = Cloudwalk::Posxml::PosxmlVersion.update(
          app_lock["id"], app_lock["version_id"], File.read(zip), self.cwfile["apps"].first
        )
        if ret
          STDOUT.write("\r=> Success Deployed                               \n")
        else
          STDOUT.write("\r=> Error #{response.code}:#{response.body}\n")
        end
      else
        raise Cloudwalk::DeployException.new("application package #{zip} not found")
      end
    end
  end
end
