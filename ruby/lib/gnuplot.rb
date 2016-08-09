Utils::Loader.batch_require_cascade(%w(
  utils/template
  helpers/gnuplot
))

class Gnuplot < Utils::Template
  attr_reader :x_range, :y_range, :x_label, :y_label
  private

  def helpers
    [ Helpers::Gnuplot ]
  end

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
