class Tex::Graph
  attr_reader :file, :label, :caption

  def initialize(file:, caption: nil, label: nil)
    @file = file
    @label = label
  end
end
