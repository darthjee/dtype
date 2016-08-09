Utils::Loader.batch_require_cascade(%w(
  gnuplot/transpose
))

class Gnuplot::Transpose::Squared < Gnuplot
  def initialize(input, output)
    super(:squared, input, output, default_variables)
  end

  def default_variables
    {
      xlabel: 'Numero Aleatorio',
      ylabel: 'Frequencia',
      output: '../eps/transpose/squared.eps',
      input: '../data/transpose/squared.dat'
    }
  end
end
