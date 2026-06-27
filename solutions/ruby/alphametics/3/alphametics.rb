module Alphametics
  attr :non_zeroes

  # Analysis is based upon backtracking per column 
  def self.solve(puzzle)
    left, right = puzzle.upcase.split("==")
    letters = puzzle.scan(/[A-Z]/).uniq
    addends = left.split("+").map(&:strip)
    result = right.strip
    @non_zeroes = (addends+[result]).select { |w| w.size > 1 }.map { |w| w[0]}.uniq
    return {} if letters.size > 10
    search_columns(addends, result, 0, 0, {}, (0..9).to_a, result.size) || {}
  end

  private
  def self.search_columns(addends, result, column, carry, subs, unused, max_length)
    return subs if column == max_length && carry == 0
    return nil if column == max_length
  
    addend_letters = addends.filter_map { |word| word[-1 - column] }
    result_letter = result[-1 - column]
  
    assign_addend_letters(
      addend_letters,
      result_letter,
      0,
      carry,
      subs,
      unused
    ) do |new_subs, new_unused, new_carry|
      found = search_columns(
        addends,
        result,
        column + 1,
        new_carry,
        new_subs,
        new_unused,
        max_length
      )

      return found if found
    end
  
    nil
  end

  def self.assign_addend_letters(letters, result_letter, index, sum, subs, unused, &block)
    if index == letters.length
      digit = sum % 10
      new_carry = sum / 10
      if subs.key?(result_letter)
        return unless subs[result_letter] == digit
        yield subs, unused, new_carry
      else
        return unless unused.include?(digit)
        return if digit == 0 && @non_zeroes.include?(result_letter)
        yield subs.merge(result_letter => digit), unused - [digit], new_carry
      end
      return
    end
  
    letter = letters[index]
  
    if subs.key?(letter)
      assign_addend_letters(letters, result_letter, index+1, sum+subs[letter], subs, unused, &block)
    else
      unused.each do |digit|
        next if digit == 0 && @non_zeroes.include?(letter)
        assign_addend_letters(
          letters,
          result_letter,
          index + 1,
          sum + digit,
          subs.merge(letter => digit),
          unused - [digit],
          &block
        )
      end
    end
  end

  # # Based on coefficient calculations.
  # def self.solve(puzzle)
  #   @letters = {}
  #   puzzle = puzzle.upcase
  #   self.nonzero_check(puzzle.gsub(/[[:punct:]]/,'').split(/\s+/))
  #   positive, negative = puzzle.split('==')
  #   letter_sums(positive.gsub(/[[:punct:]]/,'').split(/\s+/))
  #   letter_sums([negative.strip], '-')
  #   alphas = @letters.keys.sort_by { |letter| -@letters[letter].abs }
  #   return {} if alphas.size > 10
  #   search(alphas, {}, (0..9).to_a, 0) || {}
  # end

  # private

  # def self.search(alphas, subs, unused_digits, sum)
  #   letter = alphas.first
  #   coeff = @letters[letter]
  #   if alphas.size == 1
  #     return nil unless (-sum % coeff).zero?
  #     digit = -sum / coeff
  #     return nil unless unused_digits.include?(digit)
  #     return nil if digit == 0 && @non_zeroes.include?(letter)
  #     return subs.merge(letter => digit)
  #   end
  
  #   unused_digits.each do |digit|
  #     next if digit == 0 && @non_zeroes.include?(letter)
  #     result = search(
  #       alphas[1..],
  #       subs.merge(letter => digit),
  #       unused_digits - [digit],
  #       sum + coeff * digit
  #     )
  #     return result if result
  #   end
  #   nil
  # end

  # def self.letter_sums(enum, sign = '+')
  #   enum.each do |n|
  #     n.reverse.chars.each_with_index do |d, i|
  #       unless @letters.key?(d)
  #         @letters[d] = 0
  #       end
  #       @letters[d] += (sign == '+' ? 10**i : -(10**i))
  #     end
  #   end
  # end

  # def self.invalid_zero?(subs)
  #   subs.each do |l, v|
  #     return true if v == 0 and @non_zeroes.include?(l)
  #   end
  #   return false
  # end

  # def self.nonzero_check(numbers)
  #   nonzeros = numbers.map do |n|
  #     n[0] if n.size > 1
  #   end
  #   @non_zeroes = nonzeros.uniq
  # end
end