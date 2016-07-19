require './tasks/transpose'

class Tex::Transpose < Tex
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
      introexperimentsize: ::Transpose::BINOMIAL_SEGMENTS,
      introexperimentrepeats: ::Transpose::BINOMIAL_TIMES
    }
  end
end
