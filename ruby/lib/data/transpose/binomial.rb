class Data::Transpose::Binomial
  autoload :Experiment, 'data/transpose/binomial/experiment'
  autoload :Runner,     'data/transpose/binomial/runner'

  delegate :run, to: :runner

  private

  default_value :times,       Transpose::BINOMIAL_TIMES
  default_value :segments,    Transpose::BINOMIAL_SEGMENTS
  default_value :throws,      Transpose::BINOMIAL_THROWS
  default_value :source_path, Utils::FilesLoader.data.random_source
  default_value :output_path, Utils::FilesLoader.data.transpose.binomial.dat

  def runner
    @runner ||= Runner.new(times, segments, throws, source, output)
  end

  def source
    @source ||= Data::Source.new(source_path)
  end

  def output
    @output ||= File.open(output_path, 'w')
  end
end

