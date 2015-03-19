module DoceboRuby
  class ArgumentError < Exception; end
  class NotFound < Exception; end
  class RequestError < Exception; end
end

require 'docebo_ruby/api'
require 'docebo_ruby/parameters'

