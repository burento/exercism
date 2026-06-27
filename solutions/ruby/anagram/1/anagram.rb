class Anagram
  def initialize(target)
    @target = target.downcase
    @ttally = get_tally(@target)
  end

  def get_tally(word)
    word.downcase.chars.tally
  end

  def match(list)
    list.select { |w| @ttally == get_tally(w) and w.downcase != @target }
  end
end