require 'rest_client'
require 'json'
require 'digest/sha1'

module DoceboRuby
  class API
    def initialize(key: '', secret: '', url: '')
      @key = key
      @secret = secret
      @url = url
      @params ||= {}
    end

    def make_request(api, method, params)
      raise ArgumentError.new('Please specify parameters') if params.nil?
      parameters = Parameters.new params

      options = {
        :content_type => :json, 
        :accept => :json, 
        :headers => {
          'X-Authorization' => code(parameters)
        }
      }

      RestClient.post(path, options) do |response, request, result|
        case response.code
        when 200
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
  end
end
