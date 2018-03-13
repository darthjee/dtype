class Gnuplot::Transpose::Binomial < Gnuplot::Transpose
  def initialize(input, output)
    super(:binomial, input, output)
  end

  default_value :x_label, 'Success Rate'
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

  default_value :file_name, Utils::FilesLoader.data.transpose.binomial.dat
end

