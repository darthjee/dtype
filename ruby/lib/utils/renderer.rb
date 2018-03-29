module Utils
  class Renderer < Template
    attr_reader :output

    def initialize(input, output, variables = {}, helpers = [])
      @output = output
      super(input, variables, helpers)
    end

    def build
      output_file.write self
      output_file.close
    end

    private

    def output_file
      @output_file ||= File.open(output, 'w')
    end
  end
end
