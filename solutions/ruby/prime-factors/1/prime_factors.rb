class PrimeFactors 
  def self.of(factorize)
    factors, decompose, f = [], factorize, 2
    return factors if factorize <= 1
    until decompose == 1
      if decompose % f == 0
        factors << f
        decompose /= f
      else 
        f += 1
      end
    end
    factors
  end
end  