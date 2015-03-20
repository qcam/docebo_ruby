require 'rest_client'
require 'json'
require 'digest/sha1'

module DoceboRuby
  class API
    def initialize(key: '', secret: '', url: '')
      @key = key
      @secret = secret
      @url = url
    end

    def send_request(api, method, params, &block)
      raise ArgumentError.new('Please specify parameters') if params.nil?
      parameters = Parameters.new params
      options = request_options parameters
      url = rest_url api, method

      RestClient.post(url, options) do |response|
        case response.code
        when 200
          if block_given?
            yield response 
          else
            return response
          end
        when 404
          raise NotFound.new(response)
        else
          raise RequestError.new(response)
        end        
      end
    end

    protected

    def rest_url(api, method)
      if api == '' || method == ''
        raise ArgumentError.new('You need to specify a module / method') 
      end
      "#{@url}/#{api}/#{method}"
    end

    def code(parameters)
      codice = Digest::SHA1.hexdigest "#{parameters},#{@secret}"
      "Docebo #{@key}:#{codice}"
    end

    def request_options(parameters)
      {
        content_type: :json, 
        accept: :json, 
        headers: {
          'X-Authorization' => code(parameters)
        }
      }
    end
  end
end
