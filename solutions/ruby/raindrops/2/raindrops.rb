=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

class Raindrops
  SOUNDS = { 3 => 'Pling', 5 => 'Plang', 7 => 'Plong' }.freeze
  def self.convert(num)
    rhythm = SOUNDS.select { |key, sound| num % key == 0 }.values
    rhythm.empty?? num.to_s : rhythm.join
    
    # sound = ''
    # sound += 'Pling' if drop % 3 == 0 
    # sound += 'Plang' if drop % 5 == 0
    # sound += 'Plong' if drop % 7 == 0
    # sound = drop.to_s if sound == ''
    # sound
  end
end