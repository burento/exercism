class RotationalCipher
  def self.rotate(text, rotation)
    rotated = text.chars.map do |c|
      case c.bytes[0]
        when 65..90 # upper
          let = c.bytes[0] + rotation
          let -= 26 if let > 90
          let.chr
        when 97..122 # lower 
          let = c.bytes[0] + rotation
          let -= 26 if let > 122
          let.chr
        else
          c
      end
    end
    rotated.join
  end
end
