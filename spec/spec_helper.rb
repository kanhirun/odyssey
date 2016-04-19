# Note: Code coverage must start before application code is loaded.
require 'simplecov'
SimpleCov.start 'rails'

PROJECT_ROOT = File.expand_path('../..', __FILE__)
$:.unshift PROJECT_ROOT

# Strip indentation in heredocs:
require 'active_support/core_ext/string/strip'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
