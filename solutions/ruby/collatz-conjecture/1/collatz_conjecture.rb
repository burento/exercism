module CollatzConjecture
  def self.steps(n)
    raise ArgumentError if n < 1
    conject(n)
  end

  def self.conject(k)
    return 0 if k == 1
    k = ( k.even?? k/2 : (3*k)+1)
    return 1 + self.conject(k)
  end
end