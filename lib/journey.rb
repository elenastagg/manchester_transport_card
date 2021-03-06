# frozen_string_literal: true

# Journey

class Journey
  attr_reader :entry_station
  attr_reader :exit_station
  attr_reader :fare

  def initialize
    @entry_station = nil
    @exit_station = nil
    @fare = 6
  end

  def start(station)
    raise 'You have not ended the last journey' unless @entry_station.nil?

    @entry_station = station
  end

  def finish(station)
    @exit_station = station
    @fare = 1.50
  end
end
