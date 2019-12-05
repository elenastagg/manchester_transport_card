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

  describe '#end' do
    it 'applies an exit station on ending a journey' do
      subject.end("didsbury")
      expect(subject.exit_station).to equal("didsbury")
    end
  end
end