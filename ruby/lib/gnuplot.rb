Utils::Loader.require_cascade('utils/template')

class Gnuplot < Utils::Template

  private

  def default_variables
    {
      xlabel: x_label,
      ylabel: y_label,
      output: eps_output,
      plots: plots
    }
  end
end
