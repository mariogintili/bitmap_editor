require_relative './abstract_instruction'

class HorizontalInstruction < AbstractInstruction
  def parse_params(array)
    {
      x1: array.first.to_i,
      x2: array[1].to_i,
      y:  array[2].to_i,
      c:  array.last
    }
  end
end
