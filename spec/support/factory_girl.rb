# Adds `Factory` as an alias to `FactoryGirl`
Factory = FactoryGirl

RSpec.configure do |config|
  config.before(:suite) do
    FactoryGirl.find_definitions
  end
end
