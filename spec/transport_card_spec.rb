# frozen_string_literal: true

require 'transport_card'

describe TransportCard do
  describe '#initilize' do
    it 'has a default balance' do
      expect(subject.balance).to equal TransportCard::DEFAULT_BALANCE
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'increases the balance by x amount' do
      subject.top_up(30)
      subject.top_up(10)
      expect(subject.balance).to equal(40)
    end

    it 'has a maximum limit of £90' do
      expect { subject.top_up(91) }.to raise_error(
        'You can only top up to £90'
      )
    end
  end

  describe '#tap_in' do
    it { is_expected.to respond_to(:tap_in).with(1).argument }

    it 'throws an error when trying to tap in with less than £1.50 credit' do
      expect { subject.tap_in(double(:entry_station)) }.to raise_error(
        'You must have a balance of £1.50 or more'
      )
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }

    it 'is in journey' do
      subject.top_up(10)
      subject.tap_in(double(:entry_station))
      expect(subject).to be_in_journey
    end
  end

  describe '#tap_out' do
    it { is_expected.to respond_to(:tap_out) }

    it 'is expected to take off £1.50 off each journey' do
      subject.top_up(20)
      subject.tap_in(double(:entry_station))
      expect { subject.tap_out(double(:exit_station)) }.to change{ subject.balance }.by(-1.50)
    end

    it 'is not in journey' do
      subject.top_up(10)
      subject.tap_in(double(:entry_station))
      subject.tap_out(double(:exit_station))
      expect(subject).to_not be_in_journey
    end
  end

  describe '#journey_history' do
    it 'adds hash to the history array' do
      didsbury = double(:entry_station)
      victoria = double(:entry_station)
      old_trafford = double(:exit_station)
      chorlton = double(:exit_station)
      subject.top_up(10)
      subject.tap_in(didsbury)
      subject.tap_out(old_trafford)
      subject.tap_in(victoria)
      subject.tap_out(chorlton)
      expect(subject.journey_history.length).to eq(2)
      expect(subject.journey_history[0][:entry_station]).to eq(didsbury)
      expect(subject.journey_history[0][:exit_station]).to eq(old_trafford)
      expect(subject.journey_history[1][:entry_station]).to eq(victoria)
      expect(subject.journey_history[1][:exit_station]).to eq(chorlton)
    end
  end
end
