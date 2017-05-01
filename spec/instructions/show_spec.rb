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

  describe '#execute' do
    let(:editor) { BitmapEditor.new }
    let!(:image) do
      editor.image = Image.new(10,10)
      editor.image
    end
    let(:expected_format) { image.rows.map { |x| x.join('') }.join("\n") }

    before do
      (2..6).each do |i|
        image[i, i + 1] = 'L'
        image[1 + i, i] = 'N'
      end
    end

    it 'prints the current image of the editor' do
      expect(subject).to receive(:print).with(expected_format)
      subject.execute(editor)
    end
  end
end
