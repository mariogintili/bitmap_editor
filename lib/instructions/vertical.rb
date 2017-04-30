require_relative './abstract_instruction'

class VerticalInstruction < AbstractInstruction
  def parse_params(array)
    {
      x:  array.first.to_i,
      y1: array[1].to_i,
      y2: array[2].to_i,
      c:  array.last
    }
  end
end
