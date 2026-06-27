class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    uph = @speed * 221
    if @speed >= 5 and @speed <= 8
      uph *= 0.9
    elsif @speed == 9
      uph *= 0.8
    elsif @speed == 10
      uph *= 0.77
    end
    uph
  end

  def working_items_per_minute
    (production_rate_per_hour/60).to_i
  end
end
