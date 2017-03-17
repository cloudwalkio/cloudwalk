module Util
  def self.camelize(string)
    string.split("-").map {|w| w.capitalize }.map {|w|
      w.split("_").map {|w2| w2.capitalize }.join('')
    }.join('')
  end

  def self.ask(str)
    (`read -p "#{str}" value; echo $value`).chomp
  end

  def self.ask_secret(str)
    value = (`read -s -p "#{str}" value; echo $value`).chomp
    puts ""
    value
  end
end
