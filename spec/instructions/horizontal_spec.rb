require 'spec_helper'

RSpec.describe HorizontalInstruction do
  subject do
    described_class.new(['H', '3', '5', '2', 'Z'])
  end

  describe '::new' do
    it 'assigns a command and params' do
      expect(subject.command).to eq('H')
      expect(subject.params).to eq({ x1: 3, x2: 5, y: 2, c: 'Z' })
    end
  end
end
