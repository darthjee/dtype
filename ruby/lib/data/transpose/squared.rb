class Data::Transpose::Squared
  def run
    prepare
    data.each do |key, value|
      file.write("#{key}\t#{value * 1.0 / times * segments}\n")
    end
    file.close
    source.close
  end

  def [](value)
    data[value] ||= 0
  end

  def []=(key, value)
    data[key] = value
  end

  private

  default_value :times, ::Transpose::BINOMIAL_TOTAL
  default_value :segments, ::Transpose::BINOMIAL_SEGMENTS

  def source
    @source ||= Data::Source.new(Utils::FilesLoader.file(Configuration.data.random_source))
  end

  def prepare
    times.times do
      register(source.get)
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

  def file
    @file ||= File.open('../data/transpose/squared.dat', 'w')
  end
end

