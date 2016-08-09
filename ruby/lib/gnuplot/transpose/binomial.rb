Utils::Loader.batch_require_cascade(%w(
  gnuplot/transpose
  gnuplot/plot
))

class Gnuplot::Transpose::Binomial < Gnuplot
  def name
    :binomial
  end

  def x_label
    'Taxa de sucesso (%)'
  end

  def y_label
    'Frequencia'
  end

  def eps_output
    '../eps/transpose/binomial.eps'
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

