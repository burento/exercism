module PerfectNumber
  def self.classify(num)
    raise ArgumentError, "Classification is only possible for positive integers." \
        if num < 1
    aliquot_sum = factors(num).sum
    return 'deficient' if num > aliquot_sum 
    return 'perfect' if aliquot_sum == num
    return 'abundant' if num < aliquot_sum
  end

  private
  def self.factors(num)
    low, high, factors = 1, num, []
    until low > high 
      if num % low == 0
        high = num / low 
        factors += [low, high]
      end
      low += 1
    end
    factors.delete(num)
    factors.uniq.sort
  end
end