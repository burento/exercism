=begin
Write your code for the 'D&D Character' exercise in this file. Make the tests in
`dnd_character_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/dnd-character` directory.
=end

class DndCharacter
  def self.modifier(val)
    ((val - 10)/2).floor
  end

  def self.roll
    arr = []
    4.times { arr.push(Random.rand(1...6)) }
    arr.sort![1..].sum
  end
  
  def initialize
    @stats = { :strength => 0, :dexterity => 0, :constitution => 0 \
                , :intelligence => 0, :wisdom => 0, :charisma => 0 }
    @stats.keys.each { |k| @stats[k] = self.class.roll }
    @stats[:hitpoints] = 10 + self.class.modifier(@stats[:constitution])
  end

  def strength
    @stats[:strength]
  end 
  def dexterity
    @stats[:dexterity]
  end
  def constitution
    @stats[:constitution]
  end
  def intelligence
    @stats[:intelligence]
  end
  def wisdom
    @stats[:wisdom]
  end
  def charisma
    @stats[:charisma]
  end
  def hitpoints
    @stats[:hitpoints]
  end
end
