class BinarySearch
  attr_reader :arr
  def initialize(arr)
    @arr = arr
  end

  def search_for(target)
    binary_search(target, 0, @arr.size-1) || nil
  end

  private

  def binary_search(target, low, high)
    return nil if high < low 
    mid = (high+low) / 2
    val = @arr[mid]
    return mid if target == val
    return binary_search(target, low, mid-1) if target < val
    return binary_search(target, mid+1, high) if target > val
  end
end