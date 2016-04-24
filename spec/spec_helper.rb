PROJECT_ROOT = File.expand_path('../..', __FILE__)
$:.unshift PROJECT_ROOT

# Note: Code coverage must start before application code is loaded.
require 'lib/services/code_coverage'
CodeCoverage.start!

# Strip indentation in heredocs:
# TODO: Remove this after upgrading to ruby v2.3.0p0
#       Instead, use <<~ notation (squiggly heredoc)
require 'active_support/core_ext/string/strip'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
