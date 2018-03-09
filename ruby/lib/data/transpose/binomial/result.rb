class Data::Transpose::Binomial::Result
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def average
    @average ||= calculate_average
  end
  
  private

  def calculate_average
    frequencies.inject(0) do |sum, values|
      sum + values.inject { |a,b| a * b }
    end / frequencies.values.sum
  end

  def frequencies
    @frequencies ||= load_frequencies
  end

  def load_frequencies
    file.map do |line|
      line.split("\t").map(&:to_f)
    end.to_h
  end
end

