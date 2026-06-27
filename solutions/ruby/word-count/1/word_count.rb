=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  def initialize(phr)
    @arr = phr.gsub(/[\":!,\.@$%^&]/,' ').downcase.split(/\s/)\
            .map { |l| l.gsub(/^'|'$|%&/, '') }
    @arr = @arr.delete_if { |v| v == ''}
  end

  def word_count
    @arr.tally
  end
end