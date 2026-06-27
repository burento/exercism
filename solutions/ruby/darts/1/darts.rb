class Darts
  def initialize(x, y)
    @len = Math.sqrt(x.abs**2 + y.abs**2)
  end

  def score
    if @len <= 1
      return 10
    elsif @len > 1 and @len <= 5
      return 5
    elsif @len > 5 and @len <= 10
      return 1
    else 
      return 0
    end
  end
end  