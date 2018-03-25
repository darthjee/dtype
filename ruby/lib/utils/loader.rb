require 'active_support/inflector'

module Utils
  class Loader
    attr_reader :array

    def initialize(input)
      @array = input.is_a?(String) ? input.split('/') : input
    end

    def constantize
      constantize!
    rescue NameError
    end

    def constantize!
      array.map(&:camelize).join('::').constantize
    end
  end
end

