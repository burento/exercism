class Dominoes
	def self.chain?(dominoes)
		return true if dominoes.empty?

    	degrees = Hash.new(0)
    	graph = Hash.new { |h, k| h[k] = [] }

    	dominoes.each do |a, b|
			degrees[a] += 1
			degrees[b] += 1

			graph[a] << b
			graph[b] << a
    	end

    	return false if degrees.any? { |_number, degree| degree.odd? }

    	connected?(graph, degrees.keys)
  	end

  	def self.connected?(graph, nodes)
    	seen = {}
    	stack = [nodes.first]

    	until stack.empty?
      		node = stack.pop
      		next if seen[node]

      		seen[node] = true
      		graph[node].each { |neighbor| stack << neighbor }
    	end

    	nodes.all? { |node| seen[node] }
  	end

	private_class_method :connected?

	# def self.chain?(dominoes)
	# 	return true if dominoes.empty?
	# 	return false if dominoes.flatten.tally.select { |k,v| v.odd? }.any?

	# 	make_chain([], dominoes)
	# end

	# def self.make_chain(chain, remaining)
	# 	if remaining.empty?
	# 		return chain[0][0] == chain[-1][-1]
	# 	end

	# 	if chain.empty?
	# 		domino = remaining.shift
	# 		if domino[0] == domino[1] 
	# 			return make_chain([domino], remaining)
	# 		else
	# 			return make_chain([domino], remaining) || make_chain([domino.reverse], remaining)
	# 		end
	# 	else
	# 		return false unless remaining.flatten.tally.key?(chain[-1][-1])
	# 		res = false
	# 		remaining.each_with_index do |domino, idx|
	# 			if domino[0] == domino[1]
	# 				next if chain[-1][-1] != domino[0]
	# 				res = make_chain(chain + [domino], remaining.dup.tap{|r| r.delete_at(idx)})
	# 			else
	# 				if domino[0] == chain[-1][-1]
	# 					res = make_chain(chain + [domino], remaining.dup.tap{|r| r.delete_at(idx)})
	# 				elsif domino[1] == chain[-1][-1]
	# 					res = make_chain(chain + [domino].reverse, remaining.dup.tap{|r| r.delete_at(idx)})
	# 				end
	# 			end
	# 			return true if res == true
	# 		end
	# 		res
	# 	end
	# end
end