require 'date'

class Meetup
  attr :month, :year
  DOW_MAP = { :sunday => 0, :monday => 1, :tuesday => 2, :wednesday => 3\
            , :thursday => 4, :friday => 5, :saturday => 6 }
  
  def initialize(month, year)
    @month, @year = month, year
  end

  def day(dow, nth)
    case nth
      when :teenth then delta(dow, 13)
      when :first then delta(dow, 1)
      when :second then delta(dow, 8)
      when :third then delta(dow, 15)
      when :fourth then delta(dow, 22)
      when :last then delta(dow, Date.new(@year, @month, -1).day - 6)
    end
  end

  def delta(dow, start)
    tdow, ndow = Date.new(@year, @month, start).wday, DOW_MAP[dow]
    Date.new(@year, @month, start+ndow-tdow + (start+ndow-tdow < start ? 7 : 0))
  end
end