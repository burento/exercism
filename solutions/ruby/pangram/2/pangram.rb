class Pangram
  def self.pangram?(sentence)
    # return sentence.upcase.gsub(/[^[:alpha:]]/,'').chars.tally.keys.length == 26
    return sentence.upcase.scan(/[A-Z]/).uniq.count == 26
  end
end