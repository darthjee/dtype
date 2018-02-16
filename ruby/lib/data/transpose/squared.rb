class Data::Transpose::Squared
  autoload :Runner, 'data/transpose/squared/runner'
  
  delegate :run, to: :runner

  private

  def runner
    @runner ||= Runner.new(times, segments, source, file)
  end

  default_value :times, ::Transpose::BINOMIAL_TOTAL
  default_value :segments, ::Transpose::BINOMIAL_SEGMENTS

  def source
    @source ||= Data::Source.new(Utils::FilesLoader.data.random_source)
  end

  def file
    @file ||= File.open(Utils::FilesLoader.data.transpose.squared.dat, 'w')
  end
end

