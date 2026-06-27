class ResistorColorTrio
  MAP = { :black => 0, :brown => 1, :red => 2, :orange => 3, :yellow => 4, :green => 5 \
          , :blue => 6, :violet => 7, :grey => 8, :white => 9}
  COLORS = ['black','brown','red','orange','yellow','green', 
              'blue','violet','grey','white']
  
  def self.color_code(color)
    MAP[color.to_sym]
  end

  def initialize(codes)
    @codes = codes
  end

  def label
    val = value(@codes[0..1]) * (10 ** MAP[@codes[2].to_sym])
    power = ''
    
    if val >= 10**3 and val < 10**6
      power = 'kilo'
      val = val / 10**3
    elsif val >= 10**6 and val < 10**9
      power = 'mega'
      val = val / 10**6
    elsif val >= 10**9 
      power = 'giga'
      val = val / 10**9
    end

    sprintf('Resistor value: %d %sohms', val, power)
  end
  
  def value(colors) 
    val = 0
    arg1, arg2 = nil, nil
    if colors.size == 1 
      arg1 = colors[0].to_sym
      if MAP.keys.include?(arg1) 
        return MAPS[arg1]
      end
    elsif colors.size >= 2 
      arg1, arg2 = colors[0].to_sym, colors[1].to_sym
      if MAP.keys.include?(arg1) and MAP.keys.include?(arg2) 
        return "#{MAP[arg1]}#{MAP[arg2]}".to_i
      end
    end  
  end
end