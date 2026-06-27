class WordProblem
  def initialize(problem)
    @problem = problem
  end
  def answer
    prob = @problem.gsub(/^What is |\?/i,'')
    prob = prob.gsub(/plus/i,'+')
    prob = prob.gsub(/minus/i,'-')
    prob = prob.gsub(/multiplied by/i,'*')
    prob = prob.gsub(/divided by/i,'/')
    prob = prob.split(/\s/)
    raise ArgumentError if prob.size > 3 and (prob.size-3) % 2 > 0
    begin 
      if prob.size > 1
        ans = eval(prob[0..2].join(' '))
        debug "0..2 > #{ans}"
        ix = 4
        # Exercise doesn't respect PEMDAS, so process in order
        while ix <= prob.size-1
          ans = eval( [ans, prob[ix-1], prob[ix]].join(' '))
          ix += 2
        end
      else
        ans = eval(prob[0])
      end
    rescue SyntaxError, NameError
      raise ArgumentError
    end
    @answer = ans
    ans
  end
end