class SumOfMultiples
  def initialize(*bases)
    @bases = bases
  end

  def to(level)
    vals = []
    @bases.each do |base|
      base == 0 ? vals += [0] : vals += (base..level-1).step(base).to_a
    end
    vals.uniq.sum
  end
end