class Utils::FilesLoader
  attr_reader :config

  class << self
    attr_accessor :root

    def file(path)
      "#{root}/#{path}"
    end

    def method_missing(method, *args)
      new(Configuration.public_send(method))
    end
  end

  def initialize(config)
    @config = config
  end

  def method_missing(method, *args)
    path = config.public_send(method)
    path.is_a?(RecursiveOpenStruct) ? self.class.new(path) : self.class.file(path)
  end
end
