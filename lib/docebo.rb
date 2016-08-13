module Docebo
  extend self

  class ArgumentError < Exception; end
  class NotFound < Exception; end
  class RequestError < Exception; end

  def configure(&block)
    yield config
  end

  # Global settings for Docebo
  def config
    @config ||= Docebo::Configuration.new
  end
end

require 'docebo/configuration'
require 'docebo/api'
require 'docebo/parameters'
require 'docebo/resource'
require 'docebo/course'
require 'docebo/orgchart'
require 'docebo/user'

