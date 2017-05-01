require_relative './abstract_instruction'

class HorizontalInstruction < AbstractInstruction
  def parse_params(array)
    x1      = array.first.to_i
    x2      = array[1].to_i
    options = {
      x1: nil,
      x2: nil,      
      y:  array[2].to_i,
      c:  array.last
    }

    if x2 > x1
      options[:x1] = x1
      options[:x2] = x2
    else
      options[:x1] = x2
      options[:x2] = x1
    end

    options
  end

  def execute(editor)
    stroke(editor: editor)
  end

  def stroke(editor:, x1: params[:x1] - 1, x2: params[:x2] - 1, row_index: params[:y] - 1, colour: params[:c])
    return editor if x1 > x2
    editor.image[row_index, x1] = colour
    stroke(editor: editor, x1: x1 + 1, x2: x2, row_index: row_index, colour: colour)
  end
end
