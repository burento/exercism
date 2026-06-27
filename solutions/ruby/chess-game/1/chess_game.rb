module Chess
  RANKS = 1..8
  FILES = 'A'..'H'

  def self.valid_square?(rank, file)
    RANKS.include?(rank.to_i) and FILES.include?(file)
  end

  def self.nickname(first_name, last_name)
    (first_name[..1] + last_name[-2..]).upcase
  end

  def self.move_message(first_name, last_name, square)
    nick = self.nickname(first_name, last_name)
    msg = "#{nick} attempted to move to #{square}, but that is not a valid square"
    if self.valid_square?(square[1], square[0])
      msg = "#{nick} moved to #{square}"
    end
    msg
  end
end
