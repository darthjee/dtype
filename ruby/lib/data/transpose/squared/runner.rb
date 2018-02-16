class Data::Transpose::Squared::Runner
  attr_reader :times, :segments, :source, :file

  def initialize(times, segments, source, file)
    @times = times
    @segments = segments
    @source = source
    @file = file
  end

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
end

