module Kernel
  def getc(timeout = 0)
    gets.chomp[0]
  end
end

class CliPlatform
  IO = ::IO

  def self.setup
    CliPlatform::Display.standard_output = STDOUT
    Screen.setup(21, 20)
    CloudwalkHandshake.configure!
  end

  #def self.set_system_values
    #Device::System.klass                = DaFunk::Test.name
    #Device::Setting.logical_number      = DaFunk::Test.logical_number
    #CliPlatform::System.serial  = DaFunk::Test.serial
    #CliPlatform::System.brand   = DaFunk::Test.brand
    #CliPlatform::System.model   = DaFunk::Test.model
    #CliPlatform::System.battery = DaFunk::Test.battery
  #end

  class IO
    def self.get_string(min, max, option = nil)
      str = ""
      while
        str << STDIN.gets.chomp
        return str if str.size >= min
      end
    end
  end

  class Display
    class << self
      attr_accessor :standard_output
    end

    def self.print_in_line(buf, row = nil, column = nil)
      buf = (" " * column) + buf if column != nil && column > 0
      _puts buf
    end

    def self.clear
      # No way to clear from the CLI yet
      # we could use ncurses, but that's painful
    end

    def self.clear_line(line = nil)
      # No way to clear from the CLI yet
      # we could use ncurses, but that's painful
    end

    def self.display_bitmap(path, row, column)
    end

    def self._puts(*args)
      standard_output.puts(*args)
    end
  end

  class Network
    def self.started?
      true
    end

    def self.connected?
      0
    end

    def self.signal
      "0"
    end

    def self.sim_id
      ""
    end
  end

  class System
    class << self
      attr_accessor :serial, :brand, :model, :battery, :battery
    end

    def self.restart
      puts "Restart terminal!"
    end

    def self.versions
      {
        "OS"     => Device.version,
        "SDK"    => DaFunk::VERSION,
        "EMV"    => "0.0.1",
        "Pinpad" => "0.0.1"
      }
    end
  end

  class Crypto
  end

  def self.version
    "5.0.0"
  end
end


