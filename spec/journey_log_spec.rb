# frozen_string_literal: true

require 'journey_log'

describe JourneyLog do
  let(:journey){ double :journey }
  let(:station){ double :station }
  let(:journey_class){ double :journey_class, new: journey }

  subject { described_class.new(journey_class) }

  describe '#start' do
    it 'starts a journey' do
      allow(journey).to receive(:start)

      expect(journey_class).to receive(:new)
      expect(journey).to receive(:start).with(station)

      subject.start(station)
    end

    it 'records a journey' do
      allow(journey).to receive(:start)
      subject.start(station)
      expect(subject.journeys).to include journey
    end
  end
end