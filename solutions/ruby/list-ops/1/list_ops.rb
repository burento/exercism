class ListOps
  def self.arrays(arr)
    arr.sum { |_| 1}
  end

  def self.reverser(arr)
    return arr if arr.size < 1
    rev = []
    arr.each { |n| rev.prepend(n) }
    rev
  end

  def self.concatter(arr1, arr2)
    arr = Array.new(arr1)
    arr2.each { |n| arr.push(n) }
    arr
  end

  def self.mapper(arr)
    return arr if arr.size < 1
    result = []
    arr.each { |n| result << yield(n) }
    result
  end

  def self.filterer(arr)
    return arr if arr.size < 1
    result = []
    arr.each { |n| result << n if yield(n) }
    result
  end

  def self.sum_reducer(arr)
    sum = 0
    return sum if arr.size < 1
    arr.each { |n| sum += n }
    sum
  end

  def self.factorial_reducer(arr)
    fac = 1
    return fac if arr.size < 1
    arr.each { |n| fac *= n }
    fac
  end
end