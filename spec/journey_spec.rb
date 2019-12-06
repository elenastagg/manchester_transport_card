# frozen_string_literal: true

require 'journey'

describe Journey do
  describe '#initialize' do
    it 'doesn\'t have an entry station' do
      expect(subject.entry_station).to be(nil)
    end
  end

  describe '#start' do
    it 'applies an entry station on starting a journey' do
      subject.start("victoria")
      expect(subject.entry_station).to equal("victoria")
    end

    it 'can\'t start a new journey if it has not ended' do
      subject.start("victoria")
      expect { subject.start("victoria") }.to raise_error(
        'You have not ended the last journey'
      )
    end
  end

  describe '#finish' do
    it 'applies an exit station on finishing a journey' do
      subject.finish("didsbury")
      expect(subject.exit_station).to equal("didsbury")
    end
  end

  describe '#fare' do
    it 'starts as 6' do
      expect(subject.fare).to be(6)
    end

    it 'charges 1.50 for a normal journey' do
      subject.start("victoria")
      subject.finish("didsbury")
      expect(subject.fare).to eq(1.50)
    end
  end
end