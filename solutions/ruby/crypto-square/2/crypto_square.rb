class Crypto
  def initialize(text)
    @text = text
  end

  def ciphertext
    cipher = @text.downcase.chars.map { |c| c.gsub(/[^a-z0-9]/i,'')}.join() 
    return cipher if cipher.size <= 1
    c, r = square_size(cipher.size)
    square = Array.new(c) { Array.new(r, ' ')}
    r.times do |ri| 
      c.times do |ci|
        if (ri*c)+ci < cipher.size
          square[ci][ri] = cipher[(ri*c)+ci]
        end
      end
    end
    square.map(&:join).join(' ')
  end

  def square_size(len)
    c, r, flip = 1, 1, 'c'
    until (r*c) >= len and (c>=r) and (c-r<=1)
      case flip
        when 'c' then c, flip = c+1, 'r'
        else r, flip = r+1, 'c'
      end    
    end
    [c,r]
  end
end