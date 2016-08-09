require './lib/utils/loader'

Utils::Loader.base = './lib/'
Utils::Loader.batch_require_cascade(%w(
  core/array
  utils
))

