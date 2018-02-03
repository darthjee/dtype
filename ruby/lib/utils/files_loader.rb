class Utils::FilesLoader
  attr_reader :path

  class << self
    attr_accessor :root

    def method_missing(method, *args)
      for_path(method)
    end

    def for_path(path_name)
      new("#{root}/#{path_name}")
    end
  end

  def initialize(path)
    @path = path
  end

  def method_missing(method, *args)
    for_path(method)
  end

  def for_path(path_name)
    self.class.new("#{path}/#{path_name}")
  end
end
