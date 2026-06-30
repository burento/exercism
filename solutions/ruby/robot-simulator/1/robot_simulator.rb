class Simulator
  def instructions(input)
    input.chars.map do |inst|
      case inst
        when 'R' then :turn_right
        when 'L' then :turn_left
        when 'A' then :advance 
      end
    end
  end

  def evaluate(robot, directions)
    instructions(directions).each do |step|
      case step
        when :turn_right then robot.turn_right
        when :turn_left then robot.turn_left
        when :advance then robot.advance
      end
    end
  end

  def place(robot, x:, y:, direction:)
    robot.orient(direction)
    robot.at(x,y)
  end
end

class Robot
  attr_reader  :bearing, :coordinates
  BEARINGS = %i[east south west north].freeze
  ADVANCE = [[1,0],[0,-1],[-1,0],[0,1]].freeze
  
  def orient(dir)
    raise ArgumentError unless BEARINGS.include?(dir)
    @bearing = dir
  end

  def advance
    idx = BEARINGS.index(@bearing)
    x, y = @coordinates
    @coordinates = [ x + ADVANCE[idx][0], y + ADVANCE[idx][1] ]
  end

  def at(x,y)
    @coordinates = [x, y]
  end

  def turn_right
    pivot(1)
  end

  def turn_left
    pivot(-1)
  end

  private 
  def pivot(angle)
    @bearing = BEARINGS[ (BEARINGS.index(@bearing)+angle)%4 ]
  end
  
end