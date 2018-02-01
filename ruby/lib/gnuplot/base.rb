class Gnuplot::Base < Gnuplot
  attr_reader :project, :graph

  def initialize(project, graph, input, output)
    @project = project
    @graph = graph
    super(input, output, default_variables)
  end

  private

  def eps_output
    "../eps/#{project}/#{graph}.eps"
  end
end
