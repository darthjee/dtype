lib = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

autoload :Utils,     'utils'
autoload :Helpers,   'helpers'
autoload :Transpose, 'transpose'
autoload :Tex,       'tex'
autoload :Gnuplot,   'gnuplot'

require 'configuration'

require 'core'
require 'data'
require 'yaml'

Utils::FilesLoader.root = File.expand_path('../../../', __FILE__)

Configuration.env = ENV['ENV']
Configuration.configure(
  YAML.load(
    File.read('config.yml')
  )
)
