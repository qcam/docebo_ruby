require 'bundler/setup'
Bundler.setup

require 'rspec'
require 'docebo_ruby'
require 'webmock/rspec'

RSpec.configure do |config|

  # Stub API request
  config.before(:each) do
    stub_request(:post, 'example.com/course/listCourses')
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/course/listCourses.json')
      )
    stub_request(:post, 'example.com/lorem/ipsum')
      .to_return(status: 404)
  end
end
