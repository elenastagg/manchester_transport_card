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
    it { is_expected.to respond_to(:tap_in) }

    it 'throws an error when trying to tap in with less than £1.50 credit' do
      expect { subject.tap_in }.to raise_error(
        'You must have a balance of £1.50 or more'
      )
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }

    it 'is in journey' do
      subject.top_up(10)
      subject.tap_in
      expect(subject).to be_in_journey
    end
  end

  describe '#tap_out' do
    it { is_expected.to respond_to(:tap_out) }

    it 'is expected to take off £1.50 off each journey' do
      subject.top_up(20)
      subject.tap_in
      expect { subject.tap_out }.to change{ subject.balance }.by(-1.50)
    end

    it 'is not in journey' do
      subject.top_up(10)
      subject.tap_in
      subject.tap_out
      expect(subject).to_not be_in_journey
    end
  end
end
