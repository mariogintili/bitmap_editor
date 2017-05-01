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

  describe '#execute' do
    let(:editor) { BitmapEditor.new }
    let!(:image) do 
      Image.new(5,6).tap do |record|
        editor.image = record
      end
    end

    context 'left to right' do
      it 'applies a stroke horizontally for the given parameters' do
        subject.execute(editor)
        expect(image[1,2]).to eq('Z')
        expect(image[1,3]).to eq('Z')
        expect(image[1,4]).to eq('Z')
        expect(image[1,1]).not_to eq('Z')
        expect(image[0,2]).not_to eq('Z')
        expect(image[2,2]).not_to eq('Z')
      end
    end
    context 'right to left' do
      subject do
        described_class.new(['H', '5', '3', '2', 'Z'])
      end

      it 'applies a stroke horizontally for the given parameters' do
        subject.execute(editor)
        expect(image[1,2]).to eq('Z')
        expect(image[1,3]).to eq('Z')
        expect(image[1,4]).to eq('Z')
        expect(image[1,1]).not_to eq('Z')
        expect(image[0,2]).not_to eq('Z')
        expect(image[2,2]).not_to eq('Z')
      end
    end
  end
end
