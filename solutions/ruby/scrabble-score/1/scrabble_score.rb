=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end

class Scrabble
  SCORE = { :A => 1, :B => 3, :C => 3, :D => 2, :E => 1, :F => 4, :G => 2, \
            :H => 4, :I => 1, :J => 8, :K => 5, :L => 1, :M => 3, :N => 1, \
            :O => 1, :P => 3, :Q => 10, :R => 1, :S => 1, :T => 1, :U => 1,\
            :V => 4, :W => 4, :X => 8, :Y => 4, :Z => 10 }
  def initialize(word)
    @word = word
  end

  def score
    @word.upcase.chars.sum { |c| SCORE[c.to_sym]}
  end

end