=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

class Hamming
  def self.compute(a,b)
    return 0 if a == b
    raise ArgumentError if a.size != b.size
    i, ham = 0, 0
    while i < a.size 
      ham += 1 if a[i] != b[i]
      i += 1
    end
    ham    
  end
end