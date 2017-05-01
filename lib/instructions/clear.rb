require_relative './abstract_instruction'

class ClearInstruction < AbstractInstruction
  def parse_params(array)
    nil
  end

  def execute(editor)
    editor.image = Image.new(editor.image.rows.count, editor.image.columns.count)
  end
end
