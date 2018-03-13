require 'danica'

class Gnuplot::Plot::Function < Gnuplot::Plot
  attr_accessor :function
  delegate :to_gnu, to: :function

  def name
    function.name.to_gnu
  end
end


