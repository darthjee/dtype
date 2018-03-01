class Data::Transpose::Binomial
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
    end

    private

    def calculate_success_rate
      times.times { throw_dice }
      1.0 * successes / times
    end

    def throw_dice
      register(source.get)
    end

    def register(value)
      @successes += 1 if value >= 0.5
    end
  end
end

