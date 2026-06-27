module Brackets
  def self.paired?(input)
    check = input.gsub(/[^\[\]\(\)\{\}]/,'')
    debug "stripped... #{check}"
    new = 'new'
    loop do
      new = check.gsub(/\(\)|\[\]|\{\}/,'')
      break if new == '' || new == check
      check = new
    end
    return new == ''
  end
end