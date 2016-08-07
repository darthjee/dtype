require './lib/utils/loader'

Utils::Loader.batch_require_cascade(%w(
  core/array
  core/class
  utils
))

