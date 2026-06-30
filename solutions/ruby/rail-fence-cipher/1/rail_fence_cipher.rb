module RailFenceCipher
  def self.encode(msg, rails)
    gr = map_out(msg, rails)
    gr.map(&:join).join    
  end

  def self.decode(msg, rails)
    gr = map_out(msg, rails)
    cols, msgarr = msg.length, msg.chars
    gr.size.times do |r|
      cols.times do |c|
        next if gr[r][c] == nil
        gr[r][c] = msgarr.shift
      end
    end
    rail, coef = railing(rails), 2*(rails-1)
    cols.times.map do |c|
      gr[ rail[c%coef] ][c]
    end.join
  end

  private 
  def self.grid(rails, length)
    Array.new(rails) { Array.new(length, nil)}
  end
  
  def self.railing(rails)
    r = -1
    (0..(rails*2)-3).to_a.each_with_object({}) do |d, h|
      r += ( d.between?(0,rails-1) ? 1 : -1)
      h[d] = r
    end
  end
  
  def self.map_out(msg, rails)
    gr = grid(rails, msg.length)
    rail = railing(rails)
    x, y, coef = 0, 0, 2*(rails-1)
    msg.chars.each_with_index do |c, idx|
      gr[ rail[idx%coef] ][idx] = c
    end
    gr
  end
end