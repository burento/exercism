class Cipher
  attr :key
  Abc = 97
  Zbc = 122
  AZ  = 26
  
  def initialize(*key)
    if key.size == 0
      key = ''
      100.times { key << (Random.rand(25)+97).chr }
    else
      raise ArgumentError if key.join.gsub(/[^a-z]/,'').size == 0
      key = key.join
    end  
    @key = key
  end  
  
  def encode(text)
    coded = text.chars.map.with_index do |c, i|
      kshift = @key[(i % @key.size)].bytes[0] - Abc # 0..25
      let = c.bytes[0] + kshift
      let -= AZ if let > Zbc
      let.chr
    end
    coded.join
  end

  def decode(coded)
    text = coded.chars.map.with_index do |c, i|
      kshift = @key[(i % @key.size)].bytes[0] - Abc # 0..25
      let = c.bytes[0] - kshift
      let += AZ if let < Abc
      let.chr
    end
    text.join
  end
end  