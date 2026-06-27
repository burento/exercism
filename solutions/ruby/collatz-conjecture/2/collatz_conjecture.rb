module CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n.is_a?Numeric and n.positive?
    conject(n)
  end

  def self.conject(k)
    k > 1 ? 1 + self.conject( k.even?? k/2 : (3*k)+1) : 0
  end
end