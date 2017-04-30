require_relative './abstract_instruction'

class HorizontalInstruction < AbstractInstruction
  def parse_params(array)
    {
      x1: array.first,
      x2: array[1],
      y:  array[2],
      c:  array.last
    }
  end
end
