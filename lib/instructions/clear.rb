require_relative './abstract_instruction'

class ClearInstruction < AbstractInstruction
  def parse_params(array)
    nil
  end
end
