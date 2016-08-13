module Docebo
  class Resource < OpenStruct
    def self.api=(api)
      @api = api
    end

    def self.api
      @api
    end

    def self.fetch_data(method, params = {}, &block)
      @fetcher = API.new
      @fetcher.send_request(@api, method, params) do |result|
        return result unless block_given?
        yield result
      end
    end
  end
end
