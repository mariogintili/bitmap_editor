require 'spec_helper'

RSpec.describe VerticalInstruction do
  subject do
    described_class.new(['V', '2', '3', '5', 'R'])
  end

  describe '::new' do
    it 'assign a command and params' do
      expect(subject.command).to eq('V')
      expect(subject.params).to eq({ x: 2, y1: 3, y2: 5, c: 'R' })
    end
  end
end
