require_relative './instructions/create'
require_relative './instructions/clear'
require_relative './instructions/colour'
require_relative './instructions/vertical'
require_relative './instructions/horizontal'
require_relative './instructions/show'

COMMANDS = {
  'I' => CreateInstruction,
  'C' => ClearInstruction,
  'L' => ColourInstruction,
  'V' => VerticalInstruction,
  'H' => HorizontalInstruction,
  'S' => ShowInstruction
}
