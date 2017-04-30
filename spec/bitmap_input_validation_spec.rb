require 'spec_helper'

RSpec.describe BitmapInputValidation do
  describe '::new' do
    let(:instructions) { [] }
    subject { described_class.new(instructions) }

    it 'assigns instructions and errors' do
      expect(subject.instructions).to eq(instructions)
      expect(subject.errors).not_to be_nil
    end
  end

  describe '#execute' do
    let(:invalid_image) do
      [
        Instruction.new(['L', '1', '3', 'A'])
      ]
    end

    let(:unknown_command) do 
      [
        Instruction.new(['I', '5', '6']),
        Instruction.new(['swag', '1', '3', 'A'])
      ]
    end

    let(:invalid_image_dimensions) do
      [
        Instruction.new(['I', '251', '251'])
      ]
    end

    let(:invalid_stroke) do
      [
        Instruction.new(['I', '5', '6']),
        Instruction.new(['L', '10',  '11', 'A'])
      ]
    end

    let(:invalid_horizontal) do
      [
        Instruction.new(['I', '2', '2']),
        Instruction.new(['V', '2', '3', '6', 'W'])
      ]
    end

    let(:invalid_vertical) do
      [
        Instruction.new(['I', '2', '2']),
        Instruction.new(['H', '3', '5', '2', 'Z'])
      ]
    end

    it 'validates you must create an image before issuing commands' do
      validation = described_class.new(invalid_image)
      validation.execute
      expect(validation.errors[0][0]).to eq('You must create an image before drawing')
    end

    it 'validates you can only execute known commands' do
      validation = described_class.new(unknown_command)
      validation.execute
      expect(validation.errors[1][0]).to eq('swag is not a valid command')
    end

    it 'validates creating an image can only have the dimensions 1,1 to 250,250 inclusive' do
      validation = described_class.new(invalid_image_dimensions)
      validation.execute
      expect(validation.errors[0][0]).to eq('An image can be at maximum 250x250')
    end

    it 'validates you can only execute known commands that are inside of the range of the image created' do
      colour     = described_class.new(invalid_stroke)
      horizontal = described_class.new(invalid_horizontal)
      vertical   = described_class.new(invalid_vertical)
      error      = 'Command was valid but outside of range'
      [colour, horizontal, vertical].each(&:execute)

      expect(colour.errors[1][0]).to eq(error)
      expect(horizontal.errors[1][0]).to eq(error)
      expect(vertical.error[1][0]).to eq(vertical)
    end
  end
end
