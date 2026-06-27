=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
class Isogram
  def self.isogram?(word)
    return true if word == ''
    word = word.gsub(/[-\s]/,'').downcase.chars.tally.find { |c,v| v > 1 }
    return word == nil
  end
end