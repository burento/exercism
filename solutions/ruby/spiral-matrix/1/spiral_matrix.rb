class SpiralMatrix
  def initialize(size)
    @size = size
    @matrix = Array.new(@size) { Array.new(@size, 0)}
  end

  def matrix
    if @size > 0 and @matrix[0][0] == 0
      c, r, dir = 0, 0, 'RIGHT'
      (@size**2).times do |i|
        @matrix[r][c] = i+1
        if dir == 'RIGHT'
          if c+1 >= @size or @matrix[r][c+1] > 0
            dir, r = 'DOWN', r+1
          else 
            c += 1
          end
        elsif dir == 'DOWN'
          if r+1 >= @size or @matrix[r+1][c] > 0
            dir, c = 'LEFT', c-1
          else 
            r += 1
          end
        elsif dir == 'LEFT'
          if c-1 < 0 or @matrix[r][c-1] > 0
            dir, r = 'UP', r-1
          else 
            c -= 1
          end
        elsif dir == 'UP'
          if r-1 < 0 or @matrix[r-1][c] > 0
            dir, c = 'RIGHT', c+1
          else 
            r -= 1
          end
        end
      end
    end
    # @matrix.each { |r| debug "#{r}"}
    @matrix
  end
end