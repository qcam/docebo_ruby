require 'bundler/setup'
Bundler.setup

require 'rspec'
require 'docebo'
require 'webmock/rspec'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
end

RSpec.configure do |config|

  # Stub API request
  config.before(:each) do
    Docebo.configure do |c|
      c.api_key = 'the-key'
      c.api_secret = 'the-secret'
      c.api_url = 'hqc.docebosaas.com/api'
    end
  end
end
