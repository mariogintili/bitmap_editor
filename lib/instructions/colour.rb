require_relative './abstract_instruction'

class ColourInstruction < AbstractInstruction
  def parse_params(array)
    {
      x: array.first.to_i,
      y: array[1].to_i,
      c: array.last
    }
  end

  def execute(editor)
    editor.image[params[:y] - 1, params[:x] - 1] = params[:c]
  end  
end
