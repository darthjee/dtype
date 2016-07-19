class Tex
  attr_reader :name, :input, :output, :variables

  def initialize(name, input, output, variables)
    @name = name
    @input = input
    @output = output
    @variables = variables
  end

  private

  def erb_builder
    @erb_builder ||= ErbBuilder.new(input_stream, variables)
  end

  def input_stream
    @input_stream ||= input_file.read
  end

  def input_file
    @input_file ||= File.open(input)
  end
end
