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
    stub_request(:post, 'example.com/user/checkUsername')
      .with(body: {userid: 'jahuang'})
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/user/check_username/jahuang.json')
      )
    stub_request(:post, 'example.com/user/checkUsername')
      .with(body: {userid: 'nouser'})
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/user/check_username/nouser.json')
      )
    stub_request(:post, 'example.com/user/create')
      .with(body: {userid: 'jahuang', firstname: 'Jack', lastname: 'Huang', email: 'jack@example.com'})
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/user/create/success.json')
      )
    stub_request(:post, 'example.com/user/authenticate')
      .with(body: {username: 'jahuang', password: '123123123'})
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/user/authenticate/success.json')
      )
    stub_request(:post, 'example.com/user/authenticate')
      .with(body: {username: 'jahuang', password: '111222333'})
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/user/authenticate/failure.json')
      )
    stub_request(:post, 'example.com/orgchart/createNode')
      .with(body: {code: 'FirstNode123', translation: { english: 'First Node'}})
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/orgchart/create_node/success.json')
      )
    stub_request(:post, 'example.com/course/addUserSubscription')
      .with(body: {course_id: '10', id_user: '10'})
      .to_return(
        status: 200,
        body: File.new('spec/fixtures/docebo/course/add_user_subscription/success.json')
      )
  end
end
