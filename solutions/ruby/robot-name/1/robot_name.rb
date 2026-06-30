class Robot
	attr :name

	def initialize
		make_name
	end

	def self.forget
		make_name
	end

	private
	def self.make_name
		@name = (rand(26)+"A".bytes[0]).chr + (rand(26)+"A".bytes[0]).chr + rand(10).to_s + rand(10).to_s + rand(10).to_s
	end
end