module ArmstrongNumbers
  def self.include?(number)
    power = number.to_s.size
    sum = number.to_s.chars.to_a.sum { |d| d.to_i ** power}
    number == sum
  end
end
