module Bob
  attr_reader :remark
  
  def self.hey(remark)
    @remark = remark.rstrip
    return "Fine. Be that way!" if remark.gsub(/\s/,'') == '' 
    return "Calm down, I know what I'm doing!" if is_question? and is_capped? and has_alpha?
    return "Sure." if is_question?
    return "Whoa, chill out!" if is_capped? and has_alpha?
    return "Whatever."
  end

  private
  def self.is_question?
    @remark[-1] == '?'
  end
  
  def self.is_capped?
    @remark == @remark.upcase
  end

  def self.has_alpha?
    @remark.downcase.gsub(/[[:alpha:]]/,'').size != @remark.size
  end
end
