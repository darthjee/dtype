class Transpose::Data::Binomial
  REQUIREMENTS=[]

  def run
    prepare
    data.each do |key, value|
      file.write("#{key}\t#{value}\n")
    end
    file.close
  end

  def [](value)
    data[value] ||= 0
  end

  def []=(key, value)
    data[key] = value
  end

  private

  def prepare
    total.times do
      register(Random.rand)
    end
  end

  def register(value)
    self[normalized(value)] += 1
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
    Transpose::BINOMIAL_SEGMENTS
  end

  def times
    Transpose::BINOMIAL_TIMES
  end

  def file
    @file ||= File.open('../data/transpose/binomial.dat', 'w')
  end
end

