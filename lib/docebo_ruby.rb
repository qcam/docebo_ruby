require 'docebo_ruby/configuration'
require 'docebo_ruby/api'
require 'docebo_ruby/parameters'
require 'docebo_ruby/resource'
require 'docebo_ruby/course'
require 'docebo_ruby/orgchart'
require 'docebo_ruby/user'

module DoceboRuby
  extend self

  class ArgumentError < Exception; end
  class NotFound < Exception; end
  class RequestError < Exception; end

  def configure(&block)
    yield config
  end

  # Global settings for DoceboRuby
  def config
    @config ||= DoceboRuby::Configuration.new
  end
end
