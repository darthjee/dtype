class Data::Transpose::Squared
  class Runner
    attr_reader :times, :segments, :source, :output

    def initialize(times, segments, source, output)
      @times = times
      @segments = segments
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
        register(source.get)
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
