class Year
  def self.leap?(year)
    return true if (year % 4 == 0) \
      and ((year % 100 != 0) or (year % 100 == 0 and year % 400 == 0))
  end
end