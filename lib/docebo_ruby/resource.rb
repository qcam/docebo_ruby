module DoceboRuby
  class Resource < OpenStruct
    def self.api=(api)
      @api = api
    end

    def self.api
      @api
    end

    def self.fetch_data(method, &block)
      @fetcher = API.new
      @fetcher.send_request(@api, 'listCourses', {}) do |result|
        yield result
      end
    end
  end
end
