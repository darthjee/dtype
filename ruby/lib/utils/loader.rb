require './lib/utils'
require 'active_support/inflector'

module Utils
  class Loader
    attr_reader :array

    def initialize(array)
      @array = array
    end

    def constantize
      array.join('::').constantize
    end

    def require_class
      require array.join('/')
    rescue LoadError
      nil
    end

    def require_cascade
      array.inject(['.', 'lib']) do |prev, current|
        prev << current
        prev.loader.require_class if current.match(/\w+/)
        prev
      end
    end

    def require_constantize
      require_cascade
      array.map(&:camelize).loader.constantize
    end
  end
end
