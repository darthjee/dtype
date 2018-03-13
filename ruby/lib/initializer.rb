lib = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

autoload :Utils,         'utils'
autoload :Helpers,       'helpers'
autoload :Transpose,     'transpose'
autoload :Tex,           'tex'
autoload :Gnuplot,       'gnuplot'
autoload :Configuration, 'configuration'
autoload :Function,      'function'

require 'darthjee/core_ext/object/default_value'
require 'darthjee/core_ext/math'

require 'core'
require 'data'
require 'yaml'
require 'danica'

Utils::FilesLoader.root = File.expand_path('../../../', __FILE__)

Configuration.env = ENV['ENV']
Configuration.configure(
  YAML.load(
    File.read('config.yml')
  )
)
