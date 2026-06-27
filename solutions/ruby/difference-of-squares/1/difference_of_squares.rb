class Squares
  def initialize(n)
    @n = n
    @squares, @sums = 0, 0
    (n+1).times do |i|
      @squares += i**2
      @sums += i
    end
    @sums = @sums**2
  end

  def square_of_sum
    @sums
  end

  def sum_of_squares
    @squares
  end

  def difference
    @sums - @squares
  end
end