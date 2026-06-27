=begin
Write your code for the 'Acronym' exercise in this file. Make the tests in
`acronym_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/acronym` directory.
=end

class Acronym
  def self.abbreviate(phrase)
    phrase.gsub! '-', ' '
    phrase.gsub! /[^a-zA-Z0-9\s]/i, ''
    words = phrase.split ' ' 
    return words.map { |w| w[0].upcase}.join
  end
end
