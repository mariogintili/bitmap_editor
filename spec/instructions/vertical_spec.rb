require 'spec_helper'

RSpec.describe VerticalInstruction do
  subject do
    described_class.new(['V', '2', '3', '6', 'W'])
  end

  describe '::new' do
    it 'assign a command and params' do
      expect(subject.command).to eq('V')
      expect(subject.params).to eq({ x: 2, y1: 3, y2: 6, c: 'W' })
    end
  end

  describe '#execute' do
    let(:editor) { BitmapEditor.new }
    let!(:image) do
      Image.new(5,6).tap do |record|
        editor.image = record
      end
    end

    context 'up and down' do
      it 'strokes with the given colours all the values vertically' do
        subject.execute(editor)
        expect(image[2,1]).to eq('W')
        expect(image[3,1]).to eq('W')
        expect(image[4,1]).to eq('W')
        expect(image[5,1]).to eq('W')
        expect(image[1,1]).not_to eq('W')
      end
    end
    context 'down and up' do
      subject do
        described_class.new(['V', '2', '6', '3', 'W'])
      end

      it 'strokes with the given colours all the values vertically' do
        subject.execute(editor)
        expect(image[2,1]).to eq('W')
        expect(image[3,1]).to eq('W')
        expect(image[4,1]).to eq('W')
        expect(image[5,1]).to eq('W')
        expect(image[1,1]).not_to eq('W')
      end
    end
  end
end
