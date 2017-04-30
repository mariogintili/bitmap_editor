require_relative './abstract_instruction'

class ColourInstruction < AbstractInstruction
  def parse_params(array)
    {
      x: array.first.to_i,
      y: array[1].to_i,
      c: array.last
    }
  end  
end
