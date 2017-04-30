require 'spec_helper'

RSpec.describe ClearInstruction do
  subject do
    described_class.new(['C'])
  end

  describe '::new' do
    it 'assigns a command and no params' do
      expect(subject.command).to eq('C')
    end
  end
end
