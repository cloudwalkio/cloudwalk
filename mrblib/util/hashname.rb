module Util
  module Hashname
    def self.calc_hashname(name)
      name.chars.inject(5381) do |hash, ch|
        max_int = (hash << 5) + hash + ch.ord
        force_overflow_unsigned(max_int.to_f)
      end
    end

    def self.force_overflow_unsigned(i)
      i % (2**32).to_f # or equivalently: i & 0xffffffff
    end
  end
end

