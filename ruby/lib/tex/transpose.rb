class Tex::Transpose < Tex
  include Helpers::Tex
  autoload :Introduction, 'tex/transpose/introduction'

  def initialize(input, output)
    super(:transpose, input, output, default_variables)
  end

  def default_variables
    {
      title: 'Transposition of squared distribuition probability to normal distribuition',
      foot: 'Studies for R-Type',
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
