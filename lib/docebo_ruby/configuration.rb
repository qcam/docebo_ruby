# Copied from Kaminari::Config
require 'active_support/configurable'

module DoceboRuby
  # Configures global settings for Docebo
  #   DoceboRuby.configure do |config|
  #     config.url = 'example.com'
  #   end
  def self.configure(&block)
    yield @config ||= DoceboRuby::Configuration.new
  end

  # Global settings for DoceboRuby
  def self.config
    @config
  end

  class Configuration
    include ActiveSupport::Configurable
    config_accessor :saas_url
    config_accessor :api_url
    config_accessor :api_key
    config_accessor :api_secret
    config_accessor :sso_token

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  configure do |config|
    config.saas_url = 'example.com'
    config.api_url = 'example.com'
    config.api_key = 'TEST_KEY'
    config.api_secret = 'TEST_SECRET'
    config.sso_token = 'TEST_SSO'
  end
end
