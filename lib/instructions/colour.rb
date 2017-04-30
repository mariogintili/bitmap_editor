require_relative './abstract_instruction'

class ColourInstruction < AbstractInstruction
  def parse_params(array)
    {
      x: array.first,
      y: array[1],
      c: array.last
    }
  end  
end
