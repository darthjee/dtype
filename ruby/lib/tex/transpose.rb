Utils::Loader.batch_require_cascade(%w(
  helpers/tex
  tex
))

class Tex::Transpose < Tex
  include Helpers::Tex
  REQUIREMENTS=['transpose', 'core/string', 'helpers/tex']
  load_includes
  

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
