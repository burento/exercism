=begin
Write your code for the 'Eliuds Eggs' exercise in this file. Make the tests in
`eliuds_eggs_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/eliuds-eggs` directory.
=end

class EliudsEggs
  def self.egg_count(display)
    display.to_s(2).chars.sum(&:to_i)
  end
end