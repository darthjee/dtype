class Runner::Transpose::Data::Binomial < Runner
  def run
    prepare
    data.each do |key, value|
      file.write("#{key}\t#{value}\n")
    end
    file.close
  end

  private

  def prepare
    total.times do
      register(Random.rand)
    end
  end

  def register(value)
    self[normalized(value)]
  end

  def [](value)
    data[value] ||= 0
    data[value] += 1
  end

  def normalized(value)
    (value * segments).to_i * 1.0 / segments
  end

  def data
    @data ||= {}
  end

  def total
    segments * times
  end

  def segments
    100
  end

  def times
    100
  end

  def file
    @file ||= File.open('../data/transpose/binomial.dat', 'w')
  end
end

