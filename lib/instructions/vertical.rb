require_relative './abstract_instruction'

class VerticalInstruction < AbstractInstruction
  def parse_params(array)
    {
      x:  array.first,
      y1: array[1],
      y2: array[2],
      c:  array.last
    }
  end
end
