# frozen_string_literal: true

# JourneyLog

class JourneyLog

  attr_reader :journey_class
  attr_reader :entry_station

  def initialize(journey_class)
    @journey_class = journey_class
    @entry_station = nil
  end

  def start(station)
    @entry_station = station
  end

  # private
  # def current_journey

  # end
end
