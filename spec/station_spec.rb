# frozen_string_literal: true

require 'station'

describe Station do
  subject { Station.new("didsbury", 3) }
  describe '#initialize' do
    it 'has a name' do
      expect(subject.name).to be("didsbury")
    end
    it 'has a zone' do
      expect(subject.zone).to eq(3)
    end
  end
end
