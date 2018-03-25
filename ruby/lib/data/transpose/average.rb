class Data::Transpose::Average
  autoload :Experiment, 'data/transpose/average/experiment'

  delegate :run, to: :runner

  private

  default_value :times,       Transpose::AVERAGE_TIMES
  default_value :segments,    Transpose::AVERAGE_SEGMENTS
  default_value :throws,      Transpose::AVERAGE_THROWS
  default_value :source_path, Utils::FilesLoader.data.random_source
  default_value :output_path, Utils::FilesLoader.data.transpose.average.dat

  def runner
    @runner ||= Data::Transpose::Runner.new(times, segments, experiment, output)
  end

  def experiment
    Experiment.new(source, throws)
  end

  def source
    @source ||= Data::Source.new(source_path)
  end

  def output
    @output ||= File.open(output_path, 'w')
  end
end

