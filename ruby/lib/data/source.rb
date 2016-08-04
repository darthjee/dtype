class Data::Source
  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def get
    case(mode)
    when 'r'
      try_read
    when 'w'
      generate_value
    end
  end

  private

  def mode
    @mode ||= 'r'
  end

  def try_read
    read_value
  rescue EOFError
    start_writing
    generate_value
  end

  def start_writing
    @mode = 'w'
    file.close
    @file = nil
  end

  def generate_value
    Random.rand.tap do |value|
      file.puts(value)
    end
  end

  def read_value
    file.readline.to_f
  end

  def file
    @file ||= File.open(file_path, mode)
  end
end
