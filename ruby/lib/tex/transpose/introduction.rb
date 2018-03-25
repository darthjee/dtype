class Tex::Transpose::Introduction < Tex

  def variables
    {
      gaussian: Function::Gauss.new.tex,
      squared_graph: squared_graph,
      binomial_graph: binomial_graph,
      average_graph: average_graph
    }
  end

  private

  def squared_graph
    Tex::Graph.new(
      file: Utils::FilesLoader.eps.transpose.squared,
      label: 'intro:squared',
      caption: 'Squared distribuition'
    )
  end

  def binomial_graph
    Tex::Graph.new(
      file: Utils::FilesLoader.eps.transpose.binomial,
      label: 'intro:binomial',
      caption: 'Binomial experiment distribuition'
    )
  end

  def average_graph
    Tex::Graph.new(
      file: Utils::FilesLoader.eps.transpose.average,
      label: 'intro:average',
      caption: 'Gaussian distribuition'
    )
  end
end
