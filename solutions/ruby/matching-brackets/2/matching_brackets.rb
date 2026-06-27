module Brackets
  def self.paired?(input)
    check, new = input.gsub(/[^\[\]\(\)\{\}]/,''), 'new'
    loop do
      new = check.gsub(/\(\)|\[\]|\{\}/,'')
      break if new == '' || new == check
      check = new
    end
    return new == ''
  end
end