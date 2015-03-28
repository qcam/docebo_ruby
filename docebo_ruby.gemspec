$:.push(File.expand_path("../lib", __FILE__))

# Maintain your gem's version:
require 'docebo_ruby/version'

Gem::Specification.new do |s|
  s.name        = 'docebo'
  s.version     = DoceboRuby::VERSION
  s.date        = '2015-03-14'
  s.summary     = "Ruby wrapper for Docebo LMS."
  s.description = "Docebo is an online LMS."
  s.authors     = ['Jack A. Huang']
  s.email       = 'huynhquancam@gmail.com'
  s.files       = ['lib/docebo_ruby.rb']
  s.homepage    = 'http://rubygems.org/gems/hola'
  s.license     = 'MIT'

  s.add_dependency 'rest-client', '~> 1.7.3'

  s.add_development_dependency 'rspec', "~> 3.0.0"
  s.add_development_dependency 'webmock'
end
