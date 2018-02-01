class Gnuplot::Transpose < Gnuplot::Base
  TASKS=%w(squared binomial)

  autoload :Squared,  'gnuplot/transpose/squared'
  autoload :Binomial, 'gnuplot/transpose/binomial'

  def initialize(graph, input, output)
    super(:transpose, graph, input, output)
  end
end
