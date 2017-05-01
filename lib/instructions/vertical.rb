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
    stroke(editor: editor, x: params[:x], y1: params[:y1], y2: params[:y2], c: params[:c])
  end

  def stroke(editor:, x:, y1:, y2:, c:)
    (y1..y2).each do |y|
      editor.image[y - 1, x - 1] = c
    end
  end
end
