# frozen_string_literal: true

require 'journey_log'

describe JourneyLog do
  subject { JourneyLog.new(double(:journey_class)) }
  describe '#initialize' do
    it ('has a journey_class variable') do
      journey_class = double(:journey_class)
      log = JourneyLog.new(journey_class)
      expect(log.journey_class).to be(journey_class)
    end
  end

  describe '#start' do
    it ('starts with one argument') do
      station = double(:entry_station)
      subject.start(station)
      expect(subject.entry_station).to be(station)
    end
  end
end