=begin
Write your code for the 'Knapsack' exercise in this file. Make the tests in
`knapsack_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/knapsack` directory.
=end
class Knapsack
  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    items = items.select { |i| i.weight <= @max_weight } # remove items too heavy
    # Updated to check all permutations, so sorting is no longer applicable
    # items = items.sort { |a,b| [a.weight, a.value] <=> [b.weight, b.value] }
    # items = items.reverse # ensure higher value first first
    mv, cw, en, inside = 0, 0, items.size-1, []
    (0..en).each do |st|
      val, inx = search_knap(items, 0, 0, st, en, [])
      if val > mv
        inside = inx
        mv = val
      end
    end
    # only to see what's being taken
    inside.each { |i| debug "#{i.weight}, #{i.value}"}
    mv
  end

  def search_knap(items, mv, cw, st, en, inside)
    return mv, inside if st > en #search concluded, no more items
    if @max_weight >= (items[st].weight + cw) #can add
      # test 1 adds to bag
      test1, in1 = self.search_knap(items, mv+items[st].value, cw+items[st].weight, st+1, en, inside+[items[st]])
      # test 2 maybe we can get a higher value by not adding
      test2, in2 = self.search_knap(items, mv, cw, st+1, en, inside)
      # mv = [test1, test2].max
      inside, mv = test1 > test2 ? [in1, test1] : [in2, test2]
    elsif @max_weight < (items[st].weight + cw) #cannot add
      mv, inside = self.search_knap(items, mv, cw, st+1, en, inside)
    end
    return mv, inside
  end
end
