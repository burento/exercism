=begin
Write your code for the 'Clock' exercise in this file. Make the tests in
`clock_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/clock` directory.
=end

class Clock
  attr_accessor :hour, :minute
  
  def initialize(hour: 0, minute: 0)
    @hour, @minute = wind(hour: hour, minute: minute)
  end

  def wind(hour: 0, minute: 0)
    while minute >= 60 
      hour += 1
      minute -= 60
    end
    while minute < 0
      minute += 60
      hour -= 1
    end
    while hour >= 24
      hour -= 24
    end
    while hour < 0
      hour += 24
    end
    return hour, minute
  end

  def to_s
    "#{format('%02d', @hour)}:#{format('%02d', @minute)}"
  end

  def +(a)
    Clock.new(hour: @hour + a.hour, minute: @minute + a.minute)
  end

  def -(a)
    Clock.new(hour: @hour - a.hour, minute: @minute - a.minute)
  end

  def ==(a)
    @hour == a.hour and @minute == a.minute
  end
end