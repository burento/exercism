class Dominoes
	def self.chain?(dominoes)
		return true if dominoes.empty?
		return false if dominoes.flatten.tally.select { |k,v| v.odd? }.any?

		make_chain([], dominoes)
	end

	def self.make_chain(chain, remaining)
		if remaining.empty?
			return chain[0][0] == chain[-1][-1]
		end

		if chain.empty?
			domino = remaining.shift
			if domino[0] == domino[1] 
				return make_chain([domino], remaining)
			else
				return make_chain([domino], remaining) || make_chain([domino.reverse], remaining)
			end
		else
			return false unless remaining.flatten.tally.key?(chain[-1][-1])
			res = false
			remaining.each_with_index do |domino, idx|
				if domino[0] == domino[1]
					next if chain[-1][-1] != domino[0]
					res = make_chain(chain << domino, remaining.dup.tap{|r| r.delete_at(idx)})
				else
					if domino[0] == chain[-1][-1]
						res = make_chain(chain << domino, remaining.dup.tap{|r| r.delete_at(idx)})
					elsif domino[1] == chain[-1][-1]
						res = make_chain(chain << domino.reverse, remaining.dup.tap{|r| r.delete_at(idx)})
					end
				end
				return true if res == true
			end
			res
		end
	end
end