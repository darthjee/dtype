require 'safe_attribute_assignment'
Utils::Loader.require_cascade(%w(gnuplot))

class Gnuplot::Plot
  include SafeAttributeAssignment
  attr_accessor :input, :title, :x_column, :y_column, :type

  def initialize(attributes = {})
    assign_attributes(attributes)
  end
end
