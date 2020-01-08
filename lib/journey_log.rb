# frozen_string_literal: true

require './lib/journey.rb'

# JourneyLog
class JourneyLog
  attr_reader :journeys
  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    journey = @journey_class.new
    journey.start(station)
    @journeys.push(journey)
  end

  def finish(station)
    last_journey.finish(station)
  end

  private

  def last_journey
    @journeys.last
  end
end
