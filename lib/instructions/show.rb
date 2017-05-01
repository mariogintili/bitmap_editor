require_relative './abstract_instruction'

class ShowInstruction < AbstractInstruction
  def parse_params(array)
    nil
  end

  def execute(editor)
    print(editor.image.to_s)
  end

  private

  def print(string)
    puts string
  end
end
