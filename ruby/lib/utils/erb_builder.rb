require 'erb'

class Utils::ErbBuilder
  attr_reader :stream, :erb

  def initialize(stream, variables)
    @stream = stream

    variables.each do |key, value|
      code = [
        'class << self',
        "attr_accessor :#{key}",
        'end'
      ].join("\n")
      eval(code)
      public_send("#{key}=", value);
    end
  end

  def result
    erb.result binding
  end

  private

  def erb
    @erb ||= ERB.new(stream)
  end
end
