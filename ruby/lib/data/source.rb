class Data::Source
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def get
    file.readline.to_f
  end

  private

  def file
    @file ||= File.open(file_path, 'r')
  end
end
