class Sieve
  def initialize(n)
    @list, @n = (2..n).to_a, n
  end

  def primes
    it = 2
    while it != nil and it <= @n
      # rejects, @list = @list.partition { |x| x % it == 0 and x != it }
      # it = rejects.size == 0 ? nil : @list.find { |x| x > it }
      size = @list.size
      @list = @list.reject { |x| x % it == 0 and x != it }
      it = @list.size == size ? nil : @list.find { |x| x > it }
    end
    @list
  end
end

class Prime
  BUFFER = 1.3
  def self.nth(n)
    raise ArgumentError if n <= 0
    return 2 if n == 1
    return 3 if n == 2
    size = n * Math.log(n) * BUFFER
    Sieve.new(size).primes[n-1]
  end
end