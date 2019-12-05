# frozen_string_literal: true

# Journey

class Journey

  attr_reader :entry_station
  attr_reader :exit_station

  def initialize
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    raise 'You have not ended the last journey' if @entry_station == station
    @entry_station = station
  end

  def end(station)
    @exit_station = station
  end
end