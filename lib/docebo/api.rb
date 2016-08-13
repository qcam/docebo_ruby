require 'httparty'
require 'digest/sha1'
require 'base64'
require 'docebo/response'

module Docebo
  class API
    def initialize
      @url = Docebo.config.api_url
      @key = Docebo.config.api_key
      @secret = Docebo.config.api_secret
    end

    def send_request(api, method, params = {})
      Docebo::Response.new(
        HTTParty.post(
          "/#{api}/#{method}",
          base_uri: @url,
          body: params,
          headers: _default_headers(params)
        )
      )
    end

    protected

    def _default_headers(params)
      {
        'Accept' => 'application/json',
        'X-Authorization' => Docebo::Utils.code(@key, @secret, params)
      }
    end
  end
end
