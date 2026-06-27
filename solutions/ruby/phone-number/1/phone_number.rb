class PhoneNumber
  def self.clean(input)
    digits = input.gsub(/\D/, "")
    digits = digits[1..] if digits.length == 11 && digits.start_with?("1")
    return (digits.length == 10 \
            and digits[0].match?(/[2-9]/) \
            and digits[3].match?(/[2-9]/)) ? digits : nil 
  end
end