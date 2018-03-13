class Tex::Transpose::Introduction < Tex
  include Helpers::Tex
  

  def initialize(input, output)
    super(:transpose_introduction, input, output, default_variables)
  end

  def default_variables
    {
    }
  end
end
