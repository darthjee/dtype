Utils::Loader.batch_require_cascade(%w(
  utils/template
  helpers/gnuplot
))

class Gnuplot < Utils::Template
  private

  def helpers
    [ Helpers::Gnuplot ]
  end

  def default_variables
    {
      xlabel: x_label,
      ylabel: y_label,
      output: eps_output,
      plots: plots
    }
  end
end
