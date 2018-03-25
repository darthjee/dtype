class Data::Transpose::Average
  class Experiment
    attr_reader :successes, :source, :times

    def initialize(source, times)
      @source = source
      @successes = 0
      @times = times
    end

    def success_rate
      @success_rate ||= calculate_success_rate
    end

    def reset
      @success_rate = nil
      @successes = 0
    end

    private

    def calculate_success_rate
      Math.average times.times.map { source.get }
    end
  end
end

