Utils::Loader.batch_require_cascade(%w(
  gnuplot/transpose
  gnuplot/plot
))

class Gnuplot::Transpose::Binomial < Gnuplot::Transpose
  def initialize(input, output)
    super(:binomial, input, output)
  end

  def x_label
    'Taxa de sucesso (%)'
  end

  def y_label
    'Frequencia'
  end

  def plots
    [
      Gnuplot::Plot.new({
        input: '../data/transpose/binomial.dat',
        with: :boxes
      })
    ]
  end
end

