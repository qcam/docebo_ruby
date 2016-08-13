# Response Object
#
module Docebo
  class Response
    OK = 200

    def initialize(raw_response)
      @raw_response = raw_response
    end

    def code
      @raw_response.code
    end

    def ok?
      @raw_response.code == OK
    end

    def error?
      !ok?
    end

    def data
      @raw_response.parsed_response
    end
  end
end
