class Data::Transpose::Binomial
  class Experiment
    attr_reader :successes
    def initialize
      @successes = 0
      times.each { throw_dice }
    end

    def success_rate
      1.0 * successes / times
    end

    private

    def throw_dice
      register(Random.rand)
    end

    def register(value)
      successes += 1 if value >= 0.5
    end

    def times
      Transpose::BINOMIAL_THROWS
    end
  end

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
    times.times do
      register(Experiment.new.success_rate)
    end
  end

  def prepare
    (segments + 1).times do |section|
      threashold = section * 1.0 / segments

      times.times do
        register(Random.rand)
      end
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
    Transpose::BINOMIAL_TIMES
  end

  def file
    @file ||= File.open('../data/transpose/binomial.dat', 'w')
  end
end

