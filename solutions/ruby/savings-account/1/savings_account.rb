module SavingsAccount
  def self.interest_rate(balance)
    rate = 0
    if balance >= 0 and balance < 1000
      rate = 0.5  
    elsif balance >= 1000 and balance < 5000
      rate = 1.621
    elsif balance >= 5000
      rate = 2.475
    else 
      rate = 3.213
    end
    rate
  end

  def self.annual_balance_update(balance)
    balance *= (1 + (self.interest_rate(balance)/100))
    balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    balance = current_balance
    years = 0
    while balance < desired_balance
      years += 1
      balance = self.annual_balance_update(balance)
    end
    years
  end
end
