class Data::Transpose::Random
  REQUIREMENTS=[]

  def run
    times.times do
      file.puts(Random.rand)
    end
    file.close
  end

  private

  def times
    Transpose::BINOMIAL_TOTAL
  end

  def file
    @file ||= File.open('../data/transpose/random.dat', 'w')
  end
end

