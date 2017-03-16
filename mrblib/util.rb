module Util
  def camelize(string)
    string.split("-").map {|w| w.capitalize }.map {|w|
      w.split("_").map {|w2| w2.capitalize }.join('')
    }.join('')
  end

  def ask(str)
    `read -p "#{str}" value; echo $value`
  end

  def ask_secret(str)
    `read -s -p "#{str}" value; echo $value`
  end
end
