class Tournament
  Match = Struct.new(:name, :match, :win, :draw, :loss, :point)
  
  def self.tally(input)
    games = input.split(/\n/)
    scores = process_data(games)
    scores.sort_by! { |t| [-t.point, t.name]}
    output = sprintf('%-31s| MP |  W |  D |  L |  P%c', 'Team', 10)
    scores.each do |t|
      output += sprintf('%-31s|%3d |%3d |%3d |%3d |%3d%c' \
                      , t.name, t.match, t.win, t.draw, t.loss, t.point, 10)
    end
    output
  end

  def self.process_data(games)
    scores = {}
    games.each do |game|
      game = game.split(';')
      2.times do |i|
        unless scores.has_key?(game[i])
          scores[game[i]] = Match.new( game[i], 0, 0, 0, 0, 0 )
        end
        scores[game[i]].match += 1
        if game[2] == 'draw'
          scores[game[i]].draw += 1
          scores[game[i]].point += 1 
        end
      end
      
      if game[2] == 'loss'
        game[0], game[1], game[2] = game[1], game[0], 'win'
      end
      if game[2] == 'win'
          scores[game[0]].win += 1
          scores[game[0]].point += 3
          scores[game[1]].loss += 1
      end
    end
    scores.values
  end
end  