class Journey
  attr_accessor :in_journey

  def initialize(in_journey = false)
    @in_journey = in_journey
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  #
  # def in_journey?
  #   touch_in=true && touch_out=false
  # end

end
