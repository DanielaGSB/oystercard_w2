class Oystercard
  attr_accessor :balance

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 50

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    fail 'Maximum balance of 50 exceeded' if balance+amount> MAX_BALANCE
    @balance+=amount
  end

  def deduct_fare(amount)
    @balance-=amount
  end

end

private
