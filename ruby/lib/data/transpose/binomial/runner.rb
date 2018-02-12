class Data::Transpose::Binomial
  class Runner
    attr_reader :times, :segments, :throws, :source, :output

    def initialize(times, segments , throws, source, output)
      @times = times
      @segments = segments
      @throws = throws
      @source = source
      @output = output
    end

    def run
      prepare
      data.keys.sort.each do |key|
        value = data[key]
        output.write("#{key}\t#{value * 1.0 / times}\n")
      end
      output.close
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
      total_times.times do
        register(Experiment.new(source, throws).success_rate)
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

    def total_times
      @total_times ||= times * segments
    end
  end
end
