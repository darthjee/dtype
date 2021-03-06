class Transpose
  BINOMIAL_SEGMENTS = Configuration.transpose.binomial.segments
  BINOMIAL_TIMES    = Configuration.transpose.binomial.times
  BINOMIAL_THROWS   = Configuration.transpose.binomial.throws
  BINOMIAL_TOTAL    = BINOMIAL_SEGMENTS * BINOMIAL_TIMES * BINOMIAL_THROWS

  SQUARED_SEGMENTS  = Configuration.transpose.squared.segments
  SQUARED_TIMES     = Configuration.transpose.squared.times

  AVERAGE_THROWS    = Configuration.transpose.average.throws
  AVERAGE_SEGMENTS  = Configuration.transpose.average.segments
  AVERAGE_TIMES     = Configuration.transpose.average.times
end
