class Proverb
  attr :chain, :qualifier
  def initialize(*args, **kwargs)
    @chain = args
    @qualifier = kwargs
  end

  def to_s
    return "" if @chain == nil || @chain.empty? 
    proverb = ""
    (1...@chain.size).each do |i|
      proverb += sprintf("For want of a %s the %s was lost.\n", @chain[i-1], @chain[i]) 
    end
    unless @chain.empty? 
      proverb += sprintf('And all for the want of a %s%s.'\
        , (@qualifier.has_key?(:qualifier) ? ("%s " % @qualifier[:qualifier]) : '') \
        , @chain[0])
    end
    proverb
  end
end