class BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1 \
            or digits.any?{|d| d < 0 or d >= input_base } \
            or output_base <= 1
    return [0] if digits == [0] or digits.uniq == [0]

    # Code mappings for bases up to ~36? (0-9a-z)
    # if input_base > 10
    #   digits = digits.map do |d|
    #     d < 10 ? d : (d-10+97).chr
    #   end
    # end
    # digits = digits.join.to_i(input_base) #to b10
    # digits = digits.to_s(output_base).chars
    # if output_base <= 10 
    #     digits = digits.map(&:to_i)
    # else 
    #   digits = digits.map do |d|
    #     d.to_i.to_s == d ? d.to_i : d.bytes[0]-97+1+9
    #   end
    # end
    # digits

    # Calculating conversions
    if input_base != 10 
      digits = to_base_ten(input_base, digits)
    end
    unless output_base == 10
      digits = to_base(output_base, digits)
    end
    digits
  end

  def self.to_base_ten(input_base, digits)
    digits.map.with_index { |d, i| (d * (input_base ** (digits.size-1-i))) } \
        .sum.to_s.chars.map(&:to_i)
  end

  def self.to_base(output_base, digits)
    num, power, output = digits.join.to_i, 0, []
    while num > 0 
      num, rem = num.divmod(output_base)
      output.append(rem)
    end
    output.reverse
  end
end