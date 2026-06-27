class ETL
  def self.transform(old)
    old.each_with_object({}) { |(k, v), h| v.each { |l| h[l.downcase] = k } }
  end
end