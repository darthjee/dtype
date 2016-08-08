Utils::Loader.batch_require_cascade(%w(
  gnuplot/transpose
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
      input: '../data/transpose/binomial.dat'
    }
  end
end
