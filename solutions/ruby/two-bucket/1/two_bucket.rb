class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(b1_size, b2_size, target, start_bucket)
    @b1_size, @b2_size, @target, @start_bucket = b1_size, b2_size, target, start_bucket
    analyze
  end

  private
  def analyze
    start_state = ( @start_bucket == "one" ? [@b1_size, 0] : [0, @b2_size] )

    queue, seen, index = [[start_state, 1]], {}, 0

    while index < queue.length
      (b1, b2), moves = queue[index]
      index += 1

      next if seen[[b1, b2]]
      seen[[b1, b2]] = true

      if goal_reached?(b1, b2)
        @moves = moves
        return
      end

      next_states(b1, b2).each do |state|
        next if invalid_state?(*state)
        next if seen[state]
        queue << [state, moves + 1]
      end
    end
  end

  def next_states(b1, b2)
    [
      pour_one_into_two(b1, b2),
      pour_two_into_one(b1, b2),
      [@b1_size, b2],
      [b1, @b2_size],
      [0, b2],
      [b1, 0]
    ].uniq.reject { |state| state == [b1, b2] }
  end

  def pour_one_into_two(b1, b2)
    amount = [b1, @b2_size - b2].min
    [b1 - amount, b2 + amount]
  end

  def pour_two_into_one(b1, b2)
    amount = [b2, @b1_size - b1].min
    [b1 + amount, b2 - amount]
  end

  def invalid_state?(b1, b2)
    if @start_bucket == "one"
      b1 == 0 && b2 == @b2_size
    else
      b2 == 0 && b1 == @b1_size
    end
  end

  def goal_reached?(b1, b2)
    if b1 == @target
      @goal_bucket = "one"
      @other_bucket = b2
      true
    elsif b2 == @target
      @goal_bucket = "two"
      @other_bucket = b1
      true
    else
      false
    end
  end
end