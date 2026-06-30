class Robot
	attr_reader :name

	def initialize
		reset
	end

	def reset
		@name = Robot.random_names.next
	end

	def self.forget
		random_names.rewind
	end

	def self.random_names
		@@robot_names ||= ('AA000'..'ZZ999').to_a.shuffle.to_enum
	end

	# def initialize
	# 	make_name
	# end

	# def self.forget
	# 	make_name
	# end

	# private
	# def self.make_name
	# 	@name = (rand(26)+"A".bytes[0]).chr + (rand(26)+"A".bytes[0]).chr + rand(10).to_s + rand(10).to_s + rand(10).to_s
	# end
end