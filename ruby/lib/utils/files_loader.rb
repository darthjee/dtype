module Utils::FilesLoader
  class << self
    attr_accessor :root

    def file(path)
      "#{root}/#{path}"
    end
  end
end
