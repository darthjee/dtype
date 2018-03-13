require 'safe_attribute_assignment'

class Gnuplot::Plot
  include SafeAttributeAssignment
  
  autoload :Data,     'gnuplot/plot/data'
  autoload :Function, 'gnuplot/plot/function'

  def initialize(attributes = {})
    assign_attributes(default_attributes.merge(attributes))
  end

  private
  
  default_value :default_attributes, {}
end
