class Data
  class Source
    attr_reader :file_path
  
    def initialize(file_path)
      @file_path = file_path
    end
  
    def get
      case(mode)
      when 'r'
        try_read
      when 'a'
        generate_value
      end
    end
  
    def close
      file.close
      @file = nil
      @mode = 'r'
    end
  
    private
  
    def mode
      @mode ||= 'r'
    end
  
    def try_read
      read_value
    rescue EOFError, IOError
      start_writing
      generate_value
    end
  
    def start_writing
      @mode = 'a'
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
      @file ||= try_file
    end
  
    def try_file
      File.open(file_path, mode)
    rescue Errno::ENOENT
      @mode = 'a'
      File.open(file_path, mode)
    end
  end
end
