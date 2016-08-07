require 'active_support/inflector'

module Utils
  class Loader
    attr_reader :array

    class << self
      attr_accessor :base

      def loaded
        @loaded ||= []
      end

      def batch_require_cascade(libs)
        libs.each do |lib|
          require_cascade(lib)
        end
      end

      def require_cascade(lib)
        new(lib).require_cascade
      end
    end

    def initialize(input)
      @array = input.is_a?(String) ? input.split('/') : input
      @string = input.is_a?(String) ? input : input.join('/')
    end

    def constantize
      array.join('::').constantize
    end

    def require_class
      path = "#{self.class.base}#{array.join("/")}"
      require(path).tap do |result|
        self.class.loaded << path if result
      end
    rescue LoadError
      nil
    end

    def require_cascade
      array.inject([]) do |prev, current|
        prev << current
        self.class.new(prev).require_class if current.match(/\w+/)
        prev
      end
    end

    def require_constantize
      require_cascade
      array.map(&:camelize).loader.constantize
    end
  end
end

