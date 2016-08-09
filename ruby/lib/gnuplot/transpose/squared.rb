Utils::Loader.batch_require_cascade(%w(
  gnuplot/transpose
  gnuplot/plot
))

class Gnuplot::Transpose::Squared < Gnuplot
  def initialize(input, output)
    super(:squared, input, output)
  end
  
  def x_label
    'Numero Aleatorio'
  end

  def y_label
    'Frequencia'
  end

  def eps_output
    '../eps/transpose/squared.eps'
  end

  def plots
    [
      Gnuplot::Plot.new({
        input: '../data/transpose/squared.dat'
      })
    ]
  end
end

