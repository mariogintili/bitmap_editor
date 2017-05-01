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

  describe '#execute' do
    let(:editor) { BitmapEditor.new }
    let!(:image)  do
      Image.new(10,10).tap do |record|
        editor.image = record
      end
    end

    it 'paints the image for the given coordinates' do
      subject.execute(editor)
      expect(image[1,3]).to eq('A')
    end
  end
end
