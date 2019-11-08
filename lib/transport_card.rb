# frozen_string_literal: true

# TransportCard
class TransportCard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance
  attr_reader :in_journey

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  def top_up(amount)
    raise 'You can only top up to £90' if (@balance + amount) > MAXIMUM_BALANCE

    @balance = balance + amount
  end

  def tap_in
    raise 'You must have a balance of £1.50 or more' if @balance < 1.50
    # entry_station = double(:entry_station)
    @in_journey = true
  end

  def tap_out
    deduct
    @in_journey = false
  end

  private

  def deduct
    @balance = balance - 1.50
  end
end
