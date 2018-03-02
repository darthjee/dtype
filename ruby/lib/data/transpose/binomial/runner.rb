class Data::Transpose::Binomial
  class Runner
    attr_reader :times, :segments, :experiment, :output

    def initialize(times, segments , experiment, output)
      @times = times
      @segments = segments
      @experiment = experiment
      @output = output
    end

    def run
      prepare
      data.keys.sort.each do |key|
        value = data[key]
        output.write("#{key}\t#{value * 1.0 / times}\n")
      end
      output.close
      experiment.source.close
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
        experiment.reset
        register(experiment.success_rate)
      end
    end

    def register(value)
      self[normalized(value)] += 1
    end

    def normalized(value)
      return 1 - 1.0 / 2 / segments if value == 1
      (1 + (value * segments).to_i * 2) / 2.0 / segments
    end

    def data
      @data ||= {}
    end

    def total_times
      @total_times ||= times * segments
    end
  end
end
