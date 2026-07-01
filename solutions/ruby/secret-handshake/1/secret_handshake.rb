class SecretHandshake
  attr_reader  :code
  ACTIONS = ["wink", "double blink", "close your eyes", "jump"].freeze
  REVERSE = ACTIONS.length
  
  def initialize(code)
    @code = code
  end
  
  def commands
    actions = ACTIONS.each_with_index.each_with_object([]) do |(ac, idx), acc|
      acc << ac if @code & (2**idx) > 0
    end
    actions.reverse! if @code & (2**REVERSE) > 0
    actions
  end
end