require './lib/data/source'

class Data::Transpose::Squared
  REQUIREMENTS=[]

  def run
    prepare
    data.each do |key, value|
      file.write("#{key}\t#{value * 1.0 / times * segments}\n")
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

  def source
    @source ||= Data::Source.new('../data/transpose/random.dat')
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

  def segments
    Transpose::BINOMIAL_SEGMENTS
  end

  def times
    Transpose::BINOMIAL_TOTAL
  end

  def file
    @file ||= File.open('../data/transpose/squared.dat', 'w')
  end
end

