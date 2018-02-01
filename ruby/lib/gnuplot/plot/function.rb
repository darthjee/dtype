require 'danica'

class Gnuplot::Plot::Function < Gnuplot::Plot
  def to_gnu
    function.to_gnu
  end

  private

  def function
    Danica.build(:x) { x ** 2 }
  end

  def default_attributes
    {
    }
  end
end


