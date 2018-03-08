class Data::Transpose::Squared::Experiment
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def success_rate
    @success_rate ||= source.get
  end

  def reset
    @success_rate = nil
  end
end
