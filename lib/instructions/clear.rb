require_relative './abstract_instruction'

class ClearInstruction < AbstractInstruction
  def parse_params(array)
    nil
  end

  def execute(editor)
    editor.image  = Image.new(editor.image.x, editor.image.y)
  end
end
