class Sieve
  def initialize(n)
    @list, @n = (2..n).to_a, n
  end

  def primes
    it = 2
    while it != nil and it <= @n
      rejects, @list = @list.partition { |x| x % it == 0 and x != it }
      it = rejects.size == 0 ? nil : @list.find { |x| x > it }
    end
    @list
  end
end