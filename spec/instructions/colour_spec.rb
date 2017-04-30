require 'spec_helper'

RSpec.describe ColourInstruction do
  subject do
    described_class.new(['L', '1', '3', 'A'])
  end

  describe '::new' do
    it 'assigns a command and params' do
      expect(subject.command).to eq('L')
      expect(subject.params).to eq({ x: 1, y: 3, c: 'A' })
    end
  end
end
