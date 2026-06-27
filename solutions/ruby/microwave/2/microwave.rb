class Microwave
  attr :timer
  
  def initialize(input)
    minutes, seconds = input.divmod(100)
    minutes += seconds / 60
    seconds %= 60
    @timer = "%02d:%02d" % [minutes, seconds]
  end
end