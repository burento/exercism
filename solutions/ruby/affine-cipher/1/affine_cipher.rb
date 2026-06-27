class Affine
  ABC = "a".ord #97
  ZBC = "z".ord #122
  ALPHA_SIZE = ZBC-ABC+1
  
  def initialize(a, b)
    @a, @b = a, b
    unless @a.gcd(ALPHA_SIZE) == 1
      raise ArgumentError
    end
  end
  
  def encode(text)
    code = text.downcase.gsub(/[^a-z0-9]/,'').chars.map do |c|
      if c.match?(/[a-z]/)
        ((((@a*(c.ord-ABC)) + @b) % ALPHA_SIZE)+ABC).chr
      elsif c.match?(/\d/)
        c
      end
    end.join.gsub(/(.{5})(?=.)/, '\1 \2')
  end

  def decode(ciphertext)
    ciphertext.downcase.chars.filter_map do |c|
      if c.match?(/[a-z]/)
        (((modular_inverse * ((c.ord - ABC) - @b)) % ALPHA_SIZE)+ABC).chr
      elsif c.match?(/\d/)
        c
      end
    end.join
  end

  def modular_inverse
    (1...ALPHA_SIZE).find { |x| (@a * x) % ALPHA_SIZE == 1 }
  end
end