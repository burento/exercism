class Series
  def initialize(input)
    raise ArgumentError if input.gsub(/[0-9]/,'').size > 0
    @series = input.chars.map(&:to_i)
  end

  def largest_product(len)
    raise ArgumentError if len > @series.size or len < 1
    ((len-1)...@series.size).map do |n|
      @series[n-len+1..n].reduce(:*)
    end.max
  end
end