module Math
  class Gauss
    attr_reader :average, :variance
  
    def initialize(average, variance)
      @average = average
      @variance = variance
    end
  
    def calculate(x)
      nominator(x) / denominator
    end
  
    private
  
    def nominator(x)
      Math.exp(nominator_exp(x))  
    end
  
    def nominator_exp(x)
      - (quadratic_variance(x)) / basic_denominator
    end
  
    def denominator
      @denominator ||= Math.sqrt(Math::PI * basic_denominator)
    end
  
    def squared_variance
      @squared_variance ||= variance ** 2
    end
  
    def basic_denominator
      @basic_denominator ||= 2 * squared_variance
    end
  
    def quadratic_variance(x)
      (x - average) ** 2
    end
  end
end  
