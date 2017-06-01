module Util
  def self.camelize(string)
    string.split("-").map {|w| w.capitalize }.map {|w|
      w.split("_").map {|w2| w2.capitalize }.join('')
    }.join('')
  end

  def self.ask(str)
    puts str
    value = gets.chomp
    value
  end

  def self.ask_secret(str)
    puts str
    `stty -echo`
    value = gets.chomp
    `stty echo`
    value
  end
end
