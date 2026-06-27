=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end
class Matrix
  def initialize(input)
    if input.is_a? Numeric
      input = [input]
    else 
      input = input.split(/\n/)
    end
    @row_count = input.size
    @data = input.map { |r| r.split(' ').map(&:to_i) }
    @column_count = @data[0].size
    debug "#{@data}"
  end

  def row(r)
    @data[r-1]
  end

  def column(c)
    @data.map { |r| r[c-1] }
  end
end