require 'matrix'

class Image
  attr_reader :matrix
  WHITE     = 'O'
  MAX_SIZE  = 250
  MIN_SIZE  = 1

  def initialize(x,y)
    raise ArgumentError.new('X or Y must be 250 or less') if (x >= MAX_SIZE) || (y >= MAX_SIZE)
    raise ArgumentError.new('Minimum coordinates must be >= 1') if (MIN_SIZE > x) || (MIN_SIZE > y)
    @matrix = Matrix.build(
      1 >= (x - 1) ? 1 : x,
      1 >= (y - 1) ? 1 : y
    ) { WHITE }
  end

  def [](x,y)
    rows[x][y]
  end

  def []=(x, y, value)
    rows[x][y] = value
  end

  def rows
    @rows ||= matrix.send(:rows)
  end

  def columns
    matrix.transpose.send(:rows)
  end
end
