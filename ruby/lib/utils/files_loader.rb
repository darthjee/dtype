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

  def to_s
    self.class.file(config)
  end

  def method_missing(method, *args)
    self.class.new(config.public_send(method))
  end
end
