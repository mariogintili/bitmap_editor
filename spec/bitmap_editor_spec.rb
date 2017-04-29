require 'spec_helper'

RSpec.describe BitmapEditor do
  describe '#run' do
    subject do
      described_class.new
    end
    let(:lines) do
      [
        'I 5 6',
        'L 1 3 A'
      ]
    end

    before do
      allow(File).to receive(:exists?) { true }
      allow(File).to receive(:open) { lines }
      allow(subject).to receive(:open_file) { lines.each }
      allow(subject).to receive(:execute) { true }
    end

    context 'with valid input' do
      before do
        allow(subject).to receive(:validate) { true }
      end

      it 'runs the bitmap editor from the given instructions' do
        expect(subject).to receive(:validate)
        expect(subject).to receive(:execute)
        subject.run('dummy.txt')
        expect(subject.instructions.to_a).to eq(lines)
      end
    end

    context 'with invalid input' do
      before do
        allow(subject).to receive(:validate) { false }
      end

      it 'displays errors' do
        expect(subject).to receive(:display_errors)
        subject.run('dummy.txt')
      end
    end
  end
end
