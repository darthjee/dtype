class Gnuplot::Transpose < Gnuplot::Base
  TASKS=%w(squared binomial average)

  autoload :Squared,  'gnuplot/transpose/squared'
  autoload :Binomial, 'gnuplot/transpose/binomial'
  autoload :Average,  'gnuplot/transpose/average'

  def initialize(graph, input, output)
    super(:transpose, graph, input, output)
  end
end
