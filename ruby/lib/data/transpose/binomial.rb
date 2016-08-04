require './lib/data/source'

class Data::Transpose::Binomial
  REQUIREMENTS=[]

  class Experiment
    attr_reader :successes, :source

    def initialize(source)
      @source = source
      @successes = 0
      times.times { throw_dice }
    end

    def success_rate
      1.0 * successes / times
    end

    private

    def throw_dice
      register(source.get)
    end

    def register(value)
      @successes += 1 if value >= 0.5
    end

    def times
      ::Transpose::BINOMIAL_THROWS
    end
  end

  def run
    prepare
    data.keys.sort.each do |key|
      value = data[key]
      file.write("#{key}\t#{value * 1.0 / times}\n")
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
    total_times.times do
      register(Experiment.new(source).success_rate)
    end
  end

  def register(value)
    self[normalized(value)] += 1
  end

  def normalized(value)
    (value * segments).to_i * 1.0
  end

  def data
    @data ||= {}
  end

  def segments
    ::Transpose::BINOMIAL_SEGMENTS
  end

  def total_times
    @total_times ||= times * segments
  end

  def times
    ::Transpose::BINOMIAL_TIMES
  end

  def file
    @file ||= File.open('../data/transpose/binomial.dat', 'w')
  end
end

