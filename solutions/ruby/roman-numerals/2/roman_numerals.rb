class Numeric
  ROMAN_MAP = { 1 => {1 => "I", 5 => "V"} \
              , 2 => {1 => "X", 5 => "L"} \
              , 3 => {1 => "C", 5 => "D"} \
              , 4 => {1 => "M"} }
  def to_roman
    num = self
    return num if num > 3999
    roman = ''
    until num == 0
      digit = num.to_s.chars[0].to_i
      power = num.to_s.size
      if digit == 9
        roman << ROMAN_MAP[power][1] + ROMAN_MAP[power+1][1]
      elsif digit >= 6 and digit <= 8
        roman << ROMAN_MAP[power][5] + (ROMAN_MAP[power][1] * (digit-5))
      elsif digit ==  5 
        roman << ROMAN_MAP[power][5]
      elsif digit == 4
        roman << ROMAN_MAP[power][1] + ROMAN_MAP[power][5]
      elsif digit <= 3 and digit >= 1
        roman << ROMAN_MAP[power][1] * digit
      end
      num -= (digit * (10**(power-1)))
    end
    roman
  end
end