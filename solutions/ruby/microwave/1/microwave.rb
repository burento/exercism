class Microwave
  attr :timer
  
  def initialize(input)
    minutes, seconds = input.divmod(100)
    if seconds >= 60 and seconds <= 99 
      minutes = (input - seconds) / 100
      seconds -= 60
      minutes += 1
    end 
    @timer = sprintf('%02d:%02d', minutes, seconds)
  end
end