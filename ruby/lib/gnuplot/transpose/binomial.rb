Utils::Loader.batch_require_cascade(%w(
  gnuplot/transpose
  gnuplot/plot
))

class Gnuplot::Transpose::Binomial < Gnuplot
  def initialize(input, output)
    super(:binomial, input, output, default_variables)
  end

  def default_variables
    {
      xlabel: 'Taxa de sucesso (%)',
      ylabel: 'Frequencia',
      output: '../eps/transpose/binomial.eps',
      plots: plots
    }
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

