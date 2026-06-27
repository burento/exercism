class Grains
  CHESS_SQUARES = 64
  def self.square(n)
    raise ArgumentError if n > CHESS_SQUARES or n <= 0
    2 ** (n-1)
  end

  def self.total
    (1..CHESS_SQUARES).sum { |s| square(s) }
  end
end