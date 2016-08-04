class Data::Transpose::Binomial
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
end

