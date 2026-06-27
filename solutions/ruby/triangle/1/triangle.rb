class Triangle
  def initialize(sides)
    @a, @b, @c, = sides
  end

  def is_triangle?
    @a > 0 and @b > 0 and @c > 0 and (@a+@b >= @c) and (@b+@c >= @a) and (@a + @c >= @b)
  end

  def num_uniq_sides
    [@a, @b, @c].uniq.count
  end

  def equilateral?
    num_uniq_sides == 1 and is_triangle?
  end

  def isosceles?
    [1,2].include?num_uniq_sides and is_triangle?
  end

  def scalene?
    num_uniq_sides == 3 and is_triangle?
  end
end