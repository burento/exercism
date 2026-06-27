module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city[0,4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier[0,3].upcase
    terminal = 'B'
    if ['OIL','GAS'].include?(cargo)
      terminal = 'A'
    end
    terminal.to_sym
  end
end
