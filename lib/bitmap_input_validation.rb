require_relative './commands'

class BitmapInputValidation
  MAX_RANGE = 250
  attr_accessor :instructions, :errors, :valid

  def initialize(instructions)
    @instructions = instructions
    @errors       = Hash.new([])
    @valid        = false
  end

  def execute
    instructions.each.with_index do |instruction, index|
      validate(instruction, index)
    end
    valid
  end

  private

  def validate(instruction, index)
    return false if commands_before_creating_image(instruction, index)
    return false if unknown_command(instruction, index)
    return false if image_out_of_range(instruction, index)
    return false if command_out_of_range(instruction, index)
    return false if unknown_command_arguments(instruction, index)
    true
  end

  def commands_before_creating_image(instruction, index)
    if (0 == index) && (COMMANDS[:create] != instruction.command)
      errors[index].push('You must create an image before drawing')
      true
    else
      false
    end
  end

  def unknown_command(instruction, index)
    if COMMANDS.invert[instruction.command].nil?
      errors[index].push("#{instruction.command} is not a valid command")
      true
    else
      false
    end
  end

  def image_out_of_range(instruction, index)
    if COMMANDS[:create] == instruction.command && instruction.params.any? { |dimension| dimension.to_i > MAX_RANGE }
      errors[index].push('An image can be at maximum 250x250')
      true
    else
      false
    end
  end

  def command_out_of_range(instruction, index)
    # return false if 
    # image_dimensions   = instructions.first.params.map(&:to_i)
    # command_dimensions = instruction.
    # # if image_dimensions.any?
  end

  def unknown_command_arguments(instruction, index)
  end
end
