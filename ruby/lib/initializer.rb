lib = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

autoload :Utils,     'utils'
autoload :Helpers,   'helpers'
autoload :Transpose, 'transpose'
autoload :Tex,       'tex'
autoload :Gnuplot,   'gnuplot'

require 'core'
require 'data'


Utils::FilesLoader.root = File.expand_path('../../../', __FILE__)
