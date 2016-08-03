require './lib/transpose'
require './lib/string'
require './lib/helpers/tex'

class Tex::Transpose < Tex
  include Helpers::Tex

  def initialize(input, output)
    super(:transpose, input, output, default_variables)
  end

  def default_variables
    {
      title: 'Transposiçao de distribuiçao Quadrada em distribuiçao normal',
      foot: 'Estudos para R-Type',
      defines: defines
    }
  end

  def defines
    {
      introexperimentsize: format_tex_number(::Transpose::BINOMIAL_THROWS),
      introexperimentrepeats: format_tex_number(::Transpose::BINOMIAL_TIMES * ::Transpose::BINOMIAL_SEGMENTS)
    }
  end
end
