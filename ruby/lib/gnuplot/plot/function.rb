require 'danica'

class Gnuplot::Plot::Function < Gnuplot::Plot
  attr_accessor :function

  def to_gnu
    function.to_gnu
  end

  private

  def default_attributes
    {
    }
  end
end


