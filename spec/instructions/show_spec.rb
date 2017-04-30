require 'spec_helper'

RSpec.describe ShowInstruction do
  subject do
    described_class.new(['S'])
  end
  describe '::new' do
    it 'assigns a command' do
      expect(subject.command).to eq('S')
      expect(subject.params).to be_nil
    end
  end
end
