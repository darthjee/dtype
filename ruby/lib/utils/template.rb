class Utils::Template
  attr_reader :input, :variables, :helpers

  def initialize(input, variables = {}, helpers = [])
    @input = input
    @variables = variables
    @helpers = helpers
  end

  def to_s
    erb_builder.result
  end

  private

  def output_file
    @output_file ||= File.open(output, 'w')
  end

  def erb_builder
    @erb_builder ||= build_builder
  end

  def build_builder
    Utils::ErbBuilder.new(input_stream, variables).tap do |builder|
      helpers.each do |helper|
        eval("class << builder\ninclude #{helper}\nend")
      end
    end
  end

  def input_stream
    @input_stream ||= input_file.read
  end

  def input_file
    @input_file ||= File.open(input)
  end
end

