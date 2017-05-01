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
      expect(editor.image.rows.count).to eq(6)
      expect(editor.image.rows[0].count).to eq(5)
    end 
  end
end
