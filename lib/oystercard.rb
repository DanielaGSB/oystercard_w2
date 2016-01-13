class Oystercard
  attr_accessor :balance, :in_journey

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 50
  MIN_FARE = 2

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def top_up(amount)
    fail 'Maximum balance of 50 exceeded' if balance+amount> MAX_BALANCE
    @balance+=amount
  end

  def touch_in
    fail 'Insufficient funds for journey' if balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct_fare(MIN_FARE)
    @in_journey = false
  end

  private

  def deduct_fare(amount)
    @balance-=amount
  end

end
