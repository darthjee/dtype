class Gnuplot::Transpose::Squared < Gnuplot::Transpose
  def initialize(input, output)
    super(:squared, input, output)
  end

  default_value :y_range, [ 0 ]
  default_value :x_label, 'Random Number'
  default_value :y_label, 'Frequency'

  def plots
    [
      Gnuplot::Plot::Data.new({
        input: Utils::FilesLoader.data.transpose.squared.dat.to_s
      })
    ]
  end
end

