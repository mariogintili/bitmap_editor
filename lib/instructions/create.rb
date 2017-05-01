require_relative './abstract_instruction'

class CreateInstruction < AbstractInstruction
  def parse_params(array)
    {
      x: array.first.to_i,
      y: array.last.to_i
    }
  end

  def execute(editor)
    editor.image = Image.new(params[:x], params[:y])
  end
end
