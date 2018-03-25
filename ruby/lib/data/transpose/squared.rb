class Data::Transpose::Squared
  autoload :Experiment, 'data/transpose/squared/experiment'
  
  delegate :run, to: :runner

  private

  default_value :times,       ::Transpose::SQUARED_TIMES
  default_value :segments,    ::Transpose::SQUARED_SEGMENTS
  default_value :source_path, Utils::FilesLoader.data.random_source
  default_value :output_path, Utils::FilesLoader.data.transpose.squared.dat

  def runner
    @runner ||= Data::Transpose::Runner.new(times, segments, experiment, file)
  end

  def experiment
    Experiment.new(source)
  end

  def source
    @source ||= Data::Source.new(source_path)
  end

  def file
    @file ||= File.open(output_path, 'w')
  end
end

