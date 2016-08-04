class Tex
  attr_reader :name, :input, :output, :variables

  def initialize(name, input, output, variables)
    @name = name
    @input = input
    @output = output
    @variables = variables
  end

  def build
    output_file.write erb_builder.result
  end

  private

  def output_file
    @output_file ||= File.open(output, 'w')
  end

  def erb_builder
    @erb_builder ||= Utils::ErbBuilder.new(input_stream, variables)
  end

  def input_stream
    @input_stream ||= input_file.read
  end

  def input_file
    @input_file ||= File.open(input)
  end
end
