class Allergies
  attr_reader  :code
  ALLERGIES = ['eggs','peanuts','shellfish','strawberries','tomatoes',
               'chocolate','pollen','cats']
  
  def initialize(input)
    @code = input.to_s(2)
  end

  def allergic_to?(allergen)
    ix = ALLERGIES.index(allergen)
    if ix >= 0 and ix <= @code.length and @code.reverse[ix].to_i == 1
      return true
    end
    false
  end

  def list
    @code.reverse[...ALLERGIES.length].chars.each_with_index.each_with_object([]) do |(d,ix), acc|
      acc << ALLERGIES[ix] if d.to_i == 1 
    end
  end
end