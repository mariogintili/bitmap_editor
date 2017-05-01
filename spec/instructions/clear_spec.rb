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

  describe '#execute' do
    let(:editor) { BitmapEditor.new }
    let(:x) { 5 }
    let(:y) { 6 }
    let!(:image) do
      Image.new(x, y).tap do |record|
        record[1,1] = 'X'
        editor.image = record
      end
    end

    it 'assigns a new image to the editor with the same limits and default values' do
      subject.execute(editor)
      expect(editor.image.rows.count).to eq(6)
      expect(editor.image.rows[0].count).to eq(5)
      expect(editor.image[1,1]).not_to eq('X')
    end
  end
end
