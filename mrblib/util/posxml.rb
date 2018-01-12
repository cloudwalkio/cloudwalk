module Util
  class Posxml
    def self.compile(source, out)
      Util::DaFunkRuntime.setup
      posxml = PosxmlCompiler.compile(source, Util::POSXML_EN_XSD)
      File.open(out, "w") {|f| f.write(posxml) }
    end

    def self.translate(source, out)
      Util::DaFunkRuntime.setup
      ruby = PosxmlTranslate.translate(source, Util::POSXML_EN_XSD)
      File.open(out, "w") {|f| f.write(ruby) }
    end
  end
end

