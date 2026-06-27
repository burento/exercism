=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

class Luhn
  def self.valid?(input)
    input2 = input.gsub(' ','')
    input = input2.gsub(/[^0-9]/,'')
    return false if input.size <= 1 or input != input2
    checksum = 0
    (0 .. input.size-1).each do |i|
      if (input.size.even? and i % 2 == 0) or (input.size.odd? and i % 2 == 1)
        v = input[i].to_i * 2
        checksum += (v < 10 ? v : v-9)
      else
        checksum += input[i].to_i
      end
    end
    return checksum % 10 == 0
  end
end