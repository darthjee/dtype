Utils::Loader.require_cascade('utils/template')

class Tex < Utils::Template
  attr_reader :name

  def initialize(name, input, output, variables)
    @name = name

    super(input, output, variables)
  end
end
