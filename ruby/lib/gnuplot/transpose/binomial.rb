class Gnuplot::Transpose::Binomial < Gnuplot::Transpose
  def initialize(input, output)
    super(:binomial, input, output)
  end

  default_value :x_label, 'Success Rate (%)'
  default_value :y_label, 'Frequency'

  def plots
    [
      Gnuplot::Plot::Function.new,
      Gnuplot::Plot::Data.new({
        input: Utils::FilesLoader.data.transpose.binomial.dat.to_s,
        with: :boxes
      })
    ]
  end
end

