=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops
  def self.convert(drop)
    sound = ''
    sound += 'Pling' if drop % 3 == 0 
    sound += 'Plang' if drop % 5 == 0
    sound += 'Plong' if drop % 7 == 0
    sound = drop.to_s if sound == ''
    sound
  end
end