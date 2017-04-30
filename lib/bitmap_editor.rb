require_relative './commands'

class BitmapEditor
  attr_accessor :instructions, :image

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    self.instructions = open_file(file)
    execute
  end

  private

  def execute
    instructions.each { |instruction| instruction.execute(self) }
  end

  def open_file(filename)
    File.open(filename).to_a.map.with_index do |string|
      array   = string.split(' ')
      command = array.first
      COMMANDS[command].new(array)
    end
  end
end
