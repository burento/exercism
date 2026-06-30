class FlowerField
  def self.annotate(input)
    return input if [[], [""]].include?(input)
    grid = input.map(&:chars)
    rows, cols = input.size, input[0].size
    rows.times do |r|
      cols.times do |c|
        grid = update_squares(grid, r, c) if grid[r][c] == '*'
      end
    end
    grid.map(&:join)
  end

  private
  def self.update_squares(grid, r, c)
    sqs = [ [r-1, c-1], [r-1, c], [r-1, c+1], 
            [r  , c-1],           [r  , c+1], 
            [r+1, c-1], [r+1, c], [r+1, c+1]]
    
    sqs.each do |ro, co|
      next if ro < 0 || ro >= grid.size || co < 0 || co >= grid[0].size 
      ch = grid[ro][co]
      next if ch == '*'
      if ch == ' '
        grid[ro][co] = 1
      elsif grid[ro][co].is_a?Numeric
        grid[ro][co] += 1
      end
    end
    grid
  end
end
