module Blackjack
  def self.parse_card(card)
    val = 0
    case card.downcase
      when 'ace' then val = 11
      when 'two' then val = 2
      when 'three' then val = 3
      when 'four' then val = 4
      when 'five' then val = 5
      when 'six' then val = 6
      when 'seven' then val = 7
      when 'eight' then val = 8
      when 'nine' then val = 9
      when 'ten','jack','queen','king' then val = 10
    else val = 0
    end
    
  end

  def self.card_range(card1, card2)
    val = 0
    [card1, card2].each { |card| val += self.parse_card(card)}
    range = 'low'
    case val 
      when 4..11 then range = 'low'
      when 12..16 then range = 'mid'
      when 17..20 then range = 'high'
    else range = 'blackjack'
    end
    range
  end

  def self.first_turn(card1, card2, dealer_card)
    # S H P W
    range = self.card_range(card1, card2)
    dval = self.parse_card(dealer_card)
    debug "#{range} #{dval}"
    if [card1, card2].all? { |c| c == 'ace' }
      return 'P'
    elsif range == 'blackjack' 
      if dval < 10
        return 'W'
      else
        return 'S'
      end
    elsif range == 'high'
      return 'S'
    elsif range == 'mid'
      if dval >= 7
        return 'H'
      else 
        return 'S'
      end
    end
    return 'H'
  end
end
