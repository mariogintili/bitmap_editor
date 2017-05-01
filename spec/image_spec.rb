require 'spec_helper'

RSpec.describe Image do
  describe '::new' do
    context 'with values that are less than 250x250' do
      subject { described_class.new(1,1) }
      it 'initializes a matrix for the given values, where all the cells have the default white(O)' do 
        expect(subject[0,0]).to eq('O')
      end
    end
    context 'with values greater than 250x250' do
      subject { described_class.new(256, 251) }
      it 'throws argument error' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#[]=' do
    subject do
      described_class.new(10,10)
    end

    it 'assigns a value for the given coords' do
      expect(subject[1,1]).to eq('O')
      subject[1,1] = 'X'
      expect(subject[1,1]).to eq('X')
    end
  end

  describe '[]' do
    subject { described_class.new(10,10) }
    let(:value) { 'F' }

    before { subject[1,1] = value }

    it 'returns the value for the given coords' do
      expect(subject[1,1]).to eq(value)
    end
  end
end
