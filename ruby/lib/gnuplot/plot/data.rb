class Gnuplot::Plot::Data < Gnuplot::Plot
  attr_accessor :input, :title, :x_column, :y_column, :with

  private

  def default_attributes
    {
      x_column: 1,
      y_column: 2
    }
  end
end

