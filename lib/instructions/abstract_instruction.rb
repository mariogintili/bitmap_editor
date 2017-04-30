class AbstractInstruction
  attr_accessor :command, :params

  def initialize(array)
    @command = array.first
    @params  = parse_params(array.slice(1, array.length))
  end

  def parse_params(*args, &block)
    raise NotImplementedError.new("#{__method__} must be implemented in subtype")
  end
end
