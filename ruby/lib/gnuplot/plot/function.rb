require 'danica'
Utils::Loader.batch_require_cascade(%w(gnuplot/plot))

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


