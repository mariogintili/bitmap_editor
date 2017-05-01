
class Image
  attr_reader :rows, :x, :y
  WHITE     = 'O'
  MAX_SIZE  = 250
  MIN_SIZE  = 1

  def initialize(x,y)
    raise ArgumentError.new('X or Y must be 250 or less') if (x >= MAX_SIZE) || (y >= MAX_SIZE)
    raise ArgumentError.new('Minimum coordinates must be >= 1') if (MIN_SIZE > x) || (MIN_SIZE > y)
    @rows = Array.new(y) { Array.new(x, WHITE)  }
    @x    = x
    @y    = y
  end

  def [](x,y)
    rows[x][y]
  end

  def []=(x, y, value)
    rows[x][y] = value
  end

  def to_s
    rows.map { |x| x.join('') }.join("\n")
  end
end
