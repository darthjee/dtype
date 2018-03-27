class Utils::Template
  attr_reader :input, :variables, :helpers

  class << self
    def helpers
      @helpers ||= [
        Helpers::Renderer
      ]
    end
  end

  def initialize(input, variables = {}, helpers = [])
    @input = input
    @variables = variables
    @helpers = self.class.helpers + helpers
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
    hs = helpers
    Class.new(Utils::ErbBuilder) do
      hs.each do |helper|
        include helper
      end
    end.new(input_stream, variables)
  end

  def input_stream
    @input_stream ||= input_file.read
  end

  def input_file
    @input_file ||= File.open(input)
  end
end

