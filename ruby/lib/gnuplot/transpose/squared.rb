Utils::Loader.batch_require_cascade(%w(
  gnuplot/transpose
  gnuplot/plot/data
  gnuplot/plot/function
))

class Gnuplot::Transpose::Squared < Gnuplot::Transpose
  def initialize(input, output)
    super(:squared, input, output)
  end

  def y_range
    [0]
  end
  
  def x_label
    'Numero Aleatorio'
  end

  def y_label
    'Frequencia'
  end

  def plots
    [
      Gnuplot::Plot::Data.new({
        input: '../data/transpose/squared.dat'
      })
    ]
  end
end

