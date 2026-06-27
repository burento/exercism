module Alphametics
  attr :letters, :non_zeros
  
  def self.solve(puzzle)
    @letters = {}
    puzzle = puzzle.upcase
    self.nonzero_check(puzzle.gsub(/[[:punct:]]/,'').split(/\s+/))
    positive, negative = puzzle.split('==')
    letter_sums(positive.gsub(/[[:punct:]]/,'').split(/\s+/))
    letter_sums([negative.strip], '-')
    alphas = @letters.keys.sort_by { |letter| -@letters[letter].abs }
    return {} if alphas.size > 10
    search(alphas, {}, (0..9).to_a, 0) || {}
  end

  private

  def self.search(alphas, subs, unused_digits, sum)
    letter = alphas.first
    coeff = @letters[letter]
    if alphas.size == 1
      return nil unless (-sum % coeff).zero?
      digit = -sum / coeff
      return nil unless unused_digits.include?(digit)
      return nil if digit == 0 && @non_zeros.include?(letter)
      return subs.merge(letter => digit)
    end
  
    unused_digits.each do |digit|
      next if digit == 0 && @non_zeros.include?(letter)
  
      result = search(
        alphas[1..],
        subs.merge(letter => digit),
        unused_digits - [digit],
        sum + coeff * digit
      )
      return result if result
    end
    nil
  end

  def self.letter_sums(enum, sign = '+')
    enum.each do |n|
      n.reverse.chars.each_with_index do |d, i|
        unless @letters.key?(d)
          @letters[d] = 0
        end
        @letters[d] += (sign == '+' ? 10**i : -(10**i))
      end
    end
  end

  def self.invalid_zero?(subs)
    subs.each do |l, v|
      return true if v == 0 and @non_zeros.include?(l)
    end
    return false
  end

  def self.nonzero_check(numbers)
    nonzeros = numbers.map do |n|
      n[0] if n.size > 1
    end
    @non_zeros = nonzeros.uniq
  end
end