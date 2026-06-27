=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end
class Series
  def initialize(series)
    raise ArgumentError if series == ''
    @series = series
  end

  def slices(length)
    raise ArgumentError if length <= 0 or length > @series.size
    s, e, ar = 0, length-1, []
    while e < @series.size 
      ar << @series[s..e]
      s, e = s+1, e+1
    end
    ar    
  end
end