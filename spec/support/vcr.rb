VCR.configure do |config|
	config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
	config.hook_into :webmock

	# Use `:vcr` metadata to record an HTTP request, or
	# Pass a hash to set the cassette options:
	#		vcr_options = { cassette_name: "example", record: :new_episodes }
	#		describe "Using an options hash", :vcr => vcr_options do
	config.configure_rspec_metadata!
end

