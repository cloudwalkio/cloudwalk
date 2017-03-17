module Util
  class ENV
    class << self
      attr_accessor :env
    end

    def self.load
      self.env = `env`.split("\n").inject({}) do |hash, line|
        key, value = line.split("=", 2)
        hash[key] = value
        hash
      end
    end

    def self.[](key)
      self.load unless self.env
      self.env[key]
    end
  end
end
