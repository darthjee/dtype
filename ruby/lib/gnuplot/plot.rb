require 'safe_attribute_assignment'
Utils::Loader.require_cascade('gnuplot')

class Gnuplot::Plot
  include SafeAttributeAssignment

  def initialize(attributes = {})
    assign_attributes(default_attributes.merge(attributes))
  end
end
