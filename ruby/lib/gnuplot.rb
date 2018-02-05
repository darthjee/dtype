class Gnuplot < Utils::Template
  autoload :Base,      'gnuplot/base'
  autoload :Plot,      'gnuplot/plot'
  autoload :Transpose, 'gnuplot/transpose'

  attr_reader :x_range, :y_range, :x_label, :y_label

  private

  default_value :helpers, [ Helpers::Gnuplot ]

  def default_variables
    {
      xrange: x_range,
      yrange: y_range,
      xlabel: x_label,
      ylabel: y_label,
      output: eps_output,
      plots: plots
    }
  end
end
