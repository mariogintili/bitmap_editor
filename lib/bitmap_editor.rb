class BitmapEditor
  attr_accessor :instructions

  def run(file)
    return puts "please provide correct file" if file.nil? || !File.exists?(file)

    self.instructions = open_file(file)

    if validate
      self.instructions = instructions
      execute
    else
      display_errors
    end
  end

  private

  def execute
  end

  def open_file(filename)
    File.open(filename)
  end

  def validate
  end

  def display_errors
  end
end
