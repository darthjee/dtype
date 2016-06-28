class Transpose::Data
  TASKS=%w(binomial)

  def run
    Transpose::Data::Binomial.new.run
  end
end

