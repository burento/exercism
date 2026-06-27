class BottleSong
  WORD = { 10=> "ten", 9=> "nine", 8=> "eight", 7=> "seven" \
        , 6=> "six", 5=> "five", 4=> "four", 3=> "three", 2=> "two", 1=> "one", 0=> "no"}
  
  def self.recite(start_verse, num_verses)
    raise ArgumentError if start_verse < 1 or start_verse > 10 \
              or num_verses < 1 or num_verses > 10
    song = []
    while num_verses > 0 and start_verse > 0
      song << verse(start_verse)
      num_verses -= 1
      start_verse -= 1
    end
    song.join("\n")
  end

  def self.pluralize?(num)
    num == 1 ? "" : "s"
  end
  
  def self.verse(num)
    line1 = sprintf("%s green bottle%s hanging on the wall,\n" \
                , WORD[num].capitalize, pluralize?(num))
    line3 = sprintf("And if one green bottle should accidentally fall,\n")
    line4 = sprintf("There'll be %s green bottle%s hanging on the wall.\n" \
                , WORD[num-1], pluralize?(num-1))

    return line1 + line1 + line3 + line4
  end
end