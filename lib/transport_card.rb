# frozen_string_literal: true

# TransportCard
class TransportCard
  DEFAULT_BALANCE = 0
  MAXIMUM_BALANCE = 90
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :journey_history

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def in_journey?
    @entry_station != nil
  end

  def top_up(amount)
    raise 'You can only top up to £90' if (@balance + amount) > MAXIMUM_BALANCE

    @balance = balance + amount
  end

  def tap_in(entry_station)
    raise 'You must have a balance of £1.50 or more' if @balance < 1.50

    route = Hash.new
    @entry_station = entry_station
    route[:entry_station] = entry_station
    @journey_history.push(route)
  end

  def tap_out(exit_station)
    deduct
    @entry_station = nil
    @exit_station = exit_station
    @journey_history.last[:exit_station] = exit_station
  end

  private

  def deduct
    @balance = balance - 1.50
  end
end
