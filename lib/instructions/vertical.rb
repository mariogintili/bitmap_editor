require_relative './abstract_instruction'

class VerticalInstruction < AbstractInstruction
  def parse_params(array)
    y1      = array[1].to_i
    y2      = array[2].to_i
    options = {
      x:  array.first.to_i,
      c:  array.last,
      y1: nil,
      y2: nil
    }

    if y2 > y1
      options[:y1] = y1
      options[:y2] = y2
    else
      options[:y1] = y2
      options[:y2] = y1
    end

    options
  end

  def execute(editor)
    stroke(editor: editor)
  end

  def stroke(editor:, x: params[:x] - 1, y1: params[:y1] - 1, y2: params[:y2], colour: params[:c])
    return editor if y1 > y2
    editor.image[y1, x] = colour
    stroke(editor: editor, x: x, y1: y1 + 1, y2: y2, colour: colour)
  end
end
