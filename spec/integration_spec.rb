require 'spec_helper'

RSpec.describe 'Integration test' do
  let(:fixture) { "#{File.dirname(__FILE__)}/fixtures/in.txt" }
  let(:output) { File.read("#{File.dirname(__FILE__)}/fixtures/out.txt") }
  subject { BitmapEditor.new }

  it 'assigns values correctly as the example provided on the test' do
    allow_any_instance_of(ShowInstruction).to receive(:print)
    subject.run(fixture)
    expect(subject.image.to_s + "\n").to eq(output)
  end
end
