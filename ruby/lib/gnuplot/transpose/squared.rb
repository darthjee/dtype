class Gnuplot::Transpose::Squared < Gnuplot::Transpose
  def initialize(input, output)
    super(:squared, input, output)
  end

  def y_range
    [0]
  end
  
  def x_label
    'Random Number'
  end

  def y_label
    'Frequency'
  end

  def plots
    [
      Gnuplot::Plot::Data.new({
        input: '../data/transpose/squared.dat'
      })
    ]
  end
end

