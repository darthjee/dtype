Utils::Loader.require_cascade('gnuplot/base')

class Gnuplot::Transpose < Gnuplot::Base
  TASKS=%w(squared binomial)

  def initialize(graph, input, output)
    super(:transpose, graph, input, output)
  end
end
