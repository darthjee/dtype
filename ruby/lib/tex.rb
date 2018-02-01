class Tex < Utils::Template
  autoload :Transpose, 'tex/transpose'

  attr_reader :name

  def initialize(name, input, output, variables)
    @name = name

    super(input, output, variables)
  end
end
