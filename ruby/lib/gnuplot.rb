Utils::Loader.require_cascade('utils/template')

class Gnuplot < Utils::Template
  attr_reader :name

  def initialize(name, input, output)
    @name = name
    super(input, output, default_variables)
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
