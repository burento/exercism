module RunLengthEncoding
  def self.encode(input)
    out, l, count = '', '', 0
    input.chars.each_with_index do |c, idx|
      if c == l 
        count += 1
      else 
        unless idx == 0
          out += write_out(l, count)
        end
        l, count = c, 1
      end
      if idx == input.length-1
        out += write_out(l, count)
      end
    end
    out
  end

  def self.decode(input)
    out, wipc = '', ''
    input.chars.each do |c|
      if c.match?(/[[:alpha:]|\s]/) 
        out += c * (wipc == '' ? 1 : wipc.to_i)
        wipc = ''
      else
        wipc += c
      end
    end
    out
  end

  private 
  def self.write_out(ltr, count)
    (count > 1 ? count.to_s : '') + ltr
  end
end
