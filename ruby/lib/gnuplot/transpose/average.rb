class Gnuplot::Transpose::Average < Gnuplot::Transpose
  def initialize(input, output)
    super(:average, input, output)
  end

  default_value :x_label, 'Random Number'
  default_value :y_label, 'Frequency'

  def plots
    [
      gauss_plot,
      Gnuplot::Plot::Data.new({
        input: file_name,
        with: :boxes
      })
    ]
  end

  private

  def gauss_plot
    Gnuplot::Plot::Function.new(function: gauss)
  end

  def gauss
    Data::Transpose::Binomial::Result.new(file).gaussian
  end

  def file
    File.open(file_name, 'r')
  end

  default_value :file_name, Utils::FilesLoader.data.transpose.average.dat
end

