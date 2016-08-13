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

    def send_request(api, method, params)
      raise ArgumentError.new('Please specify parameters') if params.nil?
      parameters = Parameters.new params
      url = "/#{api}/#{method}"

      Docebo::Response.new(
        HTTParty.post(
          url,
          base_uri: @url,
          body: params,
          headers: _default_headers(parameters)
        )
      )
    end

    protected

    def code(parameters)
      codice = Digest::SHA1.hexdigest "#{parameters.to_s},#{@secret}"
      code = Base64.strict_encode64 "#{@key}:#{codice}"
      "Docebo #{code}"
    end

    def _default_headers(parameters)
      {
        'Accept' => 'application/json',
        'X-Authorization' => code(parameters)
      }
    end
  end
end
