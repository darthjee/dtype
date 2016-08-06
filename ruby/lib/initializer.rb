require './lib/utils/loader'

%w(
  core/array
  core/class
  utils
).each do |lib|
  Utils::Loader.new(lib).require_cascade
end
