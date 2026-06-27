=begin
Write your code for the 'Resistor Color Duo' exercise in this file. Make the tests in
`resistor_color_duo_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-duo` directory.
=end

class ResistorColorDuo
  MAP = { :black => 0, :brown => 1, :red => 2, :orange => 3, :yellow => 4, :green => 5 \
          , :blue => 6, :violet => 7, :grey => 8, :white => 9}
  
  def self.value(colors) 
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