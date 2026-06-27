class FlattenArray
  def self.flatten(arr)
    arr.flatten.reject(&:nil?)
  end
end
