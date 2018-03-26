class Tex < Utils::Template
  include Helpers::Tex
  autoload :Transpose, 'tex/transpose'
  autoload :Graph,     'tex/graph'

  def helpers
    [ Helpers::Tex ]
  end
end
