class Data
  module Transpose
    TASKS=%w(squared binomial average)

    autoload :Squared,  'data/transpose/squared'
    autoload :Binomial, 'data/transpose/binomial'
    autoload :Average,  'data/transpose/average'
    autoload :Runner,   'data/transpose/runner'
    autoload :Result,   'data/transpose/result'
  end
end
