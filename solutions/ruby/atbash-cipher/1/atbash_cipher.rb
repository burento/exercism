class Atbash
  def self.encode(text)
    translate(text)
      .gsub(/(.{5})(?=.)/, '\1 \2')
  end

  def self.decode(cipher)
    translate(cipher)
  end

  def self.translate(text)
    @A, @Z = 97, 122
    text.downcase.chars.map { |c| c.match(/^[[:alpha:]]$/) ?  
        (@Z-c.bytes[0]+@A).chr  : ((c.match(/^[0-9]$/)) ? c : '')
      }
      .join()
      .gsub(/\s/,'')
  end
end  