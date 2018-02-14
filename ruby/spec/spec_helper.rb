if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
  require 'initializer'
  Dir[File.expand_path('../../lib/**/*.rb', __FILE__)].each { |f| require f }
end

Bundler.require(:test)
require 'initializer'
Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before do
    Utils::FilesLoader.root = File.expand_path('../', __FILE__)
  end
end
