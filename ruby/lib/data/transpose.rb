class Data
  module Transpose
    TASKS=%w(squared binomial)

    autoload :Squared,  'data/transpose/squared'
    autoload :Binomial, 'data/transpose/binomial'
    autoload :Runner,   'data/transpose/runner'
  end
end
