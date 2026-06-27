class Grid
  def self.saddle_points(input)
    trees = []
    return trees if input == [[]]
    rows_max = input.map(&:max)
    cols_min = (0..input[0].size-1).map { |c| input.map { |r| r[c] }.min }
    (0..rows_max.size-1).each do |r|
      (0..cols_min.size-1).each do |c|
        check = input[r][c]
        if check == rows_max[r] and check == cols_min[c] 
          trees << { "row" => r+1, "column" => c+1 }
        end
      end
    end
    trees
  end
end