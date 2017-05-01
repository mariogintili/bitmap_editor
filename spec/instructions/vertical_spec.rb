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

  describe '#execute' do
    let(:editor) { BitmapEditor.new }
    let!(:image) do
      Image.new(7,7).tap do |record|
        editor.image = record
      end
    end

    context 'up and down' do
      it 'strokes with the given colours all the values vertically' do
        subject.execute(editor)
        expect(image[2,1]).to eq('R')
        expect(image[3,1]).to eq('R')
        expect(image[4,1]).to eq('R')
        expect(image[5,1]).to eq('R')
        expect(image[6,1]).not_to eq('R')
        expect(image[1,1]).not_to eq('R')
      end
    end
    context 'down and up' do
      subject do
        described_class.new(['V', '2', '5', '3', 'R'])
      end

      it 'strokes with the given colours all the values vertically' do
        subject.execute(editor)
        expect(image[2,1]).to eq('R')
        expect(image[3,1]).to eq('R')
        expect(image[4,1]).to eq('R')
        expect(image[5,1]).to eq('R')
        expect(image[6,1]).not_to eq('R')
        expect(image[1,1]).not_to eq('R')
      end
    end
  end
end
