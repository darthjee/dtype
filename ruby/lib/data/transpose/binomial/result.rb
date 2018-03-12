class Data::Transpose::Binomial::Result
  attr_reader :file

  def initialize(file)
    @file = file
  end

  def average
    @average ||= calculate_average
  end

  def variance
    Math.average(variances)
  end
  
  private

  def calculate_average
    Math.average(frequencies)
  end

  def frequencies
    @frequencies ||= load_frequencies
  end

  def variances
    frequencies.inject(Hash.new { 0 }) do |out, (x, f)|
      out[(x - average) ** 2] += f
      out
    end
  end

  def load_frequencies
    file.map do |line|
      line.split("\t").map(&:to_f)
    end.to_h
  end
end

