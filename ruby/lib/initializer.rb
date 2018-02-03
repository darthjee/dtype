lib = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'core'
require 'utils'

require 'helpers'
require 'data'
require 'transpose'
require 'tex'
require 'gnuplot'

Utils::FilesLoader.root = File.expand_path('../../../', __FILE__)
