require 'safe_attribute_assignment'
Utils::Loader.batch_require_cascade(%w(gnuplot/plot))

class Gnuplot::Plot::Data < Gnuplot::Plot
  include SafeAttributeAssignment
  attr_accessor :input, :title, :x_column, :y_column, :with

  def initialize(attributes = {})
    assign_attributes(default_attributes.merge(attributes))
  end

  private

  def default_attributes
    {
      x_column: 1,
      y_column: 2
    }
  end
end

