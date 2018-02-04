require 'active_support/core_ext/module/delegation'
require 'singleton'
require 'recursive_open_struct'

class Configuration
  include Singleton

  class << self
    delegate :configure, :method_missing, to: :instance
  end

  attr_reader :config

  def configure(hash = nil)
    @config_object = nil
    @config = hash
    self
  end

  def method_missing(method, *args)
    config_object.public_send(method, *args)
  end

  private

  def config_object
    @config_object ||= RecursiveOpenStruct.new(config)
  end
end
