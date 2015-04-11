module DoceboRuby
  if defined?(Rails)
    require 'docebo_ruby/engine'
  end
  class ArgumentError < Exception; end
  class NotFound < Exception; end
  class RequestError < Exception; end
end


require 'docebo_ruby/configuration'
require 'docebo_ruby/api'
require 'docebo_ruby/parameters'
require 'docebo_ruby/resource'
require 'docebo_ruby/course'
require 'docebo_ruby/user'

