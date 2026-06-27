class Palindromes
  Result = Struct.new(:value, :factors)
  attr_reader :min_factor, :max_factor

  def initialize(max_factor:, min_factor: 1)
    raise ArgumentError, "min must be <= max" if min_factor > max_factor
    @min_factor = min_factor
    @max_factor = max_factor
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def generate
    min_product = min_factor * min_factor
    max_product = max_factor * max_factor

    palindromes_between(min_product, max_product).each do |product|
      lower = [min_factor, (product.to_f / max_factor).ceil].max
      upper = [max_factor, Math.sqrt(product).to_i].min

      next if lower > upper
      (lower..upper).each do |a|
        next unless (product % a).zero?
        b = product / a
        @palindromes[product] << [a, b]
      end
    end
  end

  def smallest
    result(@palindromes.keys.min)
  end

  def largest
    result(@palindromes.keys.max)
  end  
  
  private

  def result(value)
    Result.new(value, value ? @palindromes[value] : [])
  end

  def palindromes_between(min, max)
    palindromes = []
    half = 1

    loop do
      left = half.to_s
      odd = (left + left[0...-1].reverse).to_i
      even = (left + left.reverse).to_i
      palindromes << odd if odd.between?(min, max)
      palindromes << even if even.between?(min, max)
      
      break if odd > max && even > max
      half += 1
    end

    palindromes.uniq.sort
  end
end

  # O(n**2)
  # def generate
  #   @palindromes = Hash.new { |hash, key| hash[key] = [] }
  
  #   (min_factor..max_factor).each do |a|
  #     (a..max_factor).each do |b|
  #       product = a * b
  #       next unless palindrome?(product)
  
  #       @palindromes[product] << [a, b]
  #     end
  #   end
  # end

  