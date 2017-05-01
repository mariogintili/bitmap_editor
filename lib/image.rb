require 'matrix'

class Image
  attr_reader :matrix
  WHITE    = 'O'
  MAX_SIZE = 250

  def initialize(x,y)
    raise ArgumentError.new('X or Y must be 250 or less') if (x >= MAX_SIZE) || (y >= MAX_SIZE)
    @matrix = Matrix.build(x,y) { WHITE }
  end

  def [](x,y)
    rows[x][y]
  end

  def []=(x, y, value)
    rows[x][y] = value
  end

  def rows
    matrix.send(:rows)
  end
end
