module PigLatin
	VOWELS = ['a','e','i','o','u'].freeze

	def self.translate(phrase)
		words = phrase.downcase.split(/\s/)
		piglatin = words.map do |word|
			v = word.index(/[#{VOWELS.join}]/)
			y = word.index(/[y]/)

			if v == 0 or (word.length > 2 and ['xr','yt'].include?(word[..1]))
				word + "ay" #Rule 1
			elsif y != nil and y > 0 and (v == nil or v > y)
				word[y..] + word[...y] + 'ay' #Rule 4
			elsif v != nil and v > 0 
				if word[v-1..v] == 'qu' 
					word[v+1..] + word[..v] + 'ay' # Rule 3
				else
					word[v..] + word[...v] + 'ay' # Rule 2
				end
			end
		end
		piglatin.join(' ')
	end
end