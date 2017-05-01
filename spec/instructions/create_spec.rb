require 'spec_helper'

RSpec.describe CreateInstruction do
  subject do
    described_class.new(['I', '5', '6'])
  end

  describe '::new' do
    it 'assigns a command and params' do
      expect(subject.command).to eq('I')
      expect(subject.params).to eq({ x: 5, y: 6 })
    end
  end

  describe '#execute' do
    let(:editor) { BitmapEditor.new }

    it 'assigns an image to the editor for the given coordinates' do
      subject.execute(editor)
      expect(editor.image.rows.count).to eq(5)
      expect(editor.image.columns.count).to eq(6)
    end 
  end
end
