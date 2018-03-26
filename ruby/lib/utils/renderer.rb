class Utils::Renderer
  attr_reader :input, :output, :variables, :helpers

  class << self
    def helpers
      @helpers ||= []
    end
  end

  def initialize(input, output, variables = {}, helpers = self.class.helpers)
    @input = input
    @output = output
    @variables = variables
    @helpers = helpers
  end

  def build
    output_file.write template
    output_file.close
  end

  private

  def output_file
    @output_file ||= File.open(output, 'w')
  end

  def template
    @template || Utils::Template.new(
      input, variables, helpers
    )
  end
end
