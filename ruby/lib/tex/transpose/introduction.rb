class Tex::Transpose::Introduction < Tex
  def variables
    {
      gaussian: Function::Gauss.new.tex,
      squared_graph: squared_graph
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
end
