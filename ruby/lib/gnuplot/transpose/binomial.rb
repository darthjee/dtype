class Gnuplot::Transpose::Binomial < Gnuplot::Transpose
  def initialize(input, output)
    super(:binomial, input, output)
  end

  def x_label
    'Success Rate (%)'
  end

  def y_label
    'Frequency'
  end

  def plots
    [
      Gnuplot::Plot::Function.new,
      Gnuplot::Plot::Data.new({
        input: '../data/transpose/binomial.dat',
        with: :boxes
      })
    ]
  end
end

