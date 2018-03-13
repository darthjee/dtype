class Tex::Transpose::Introduction < Tex
  def variables
    {
      gaussian: Function::Gauss.new
    }
  end
end
