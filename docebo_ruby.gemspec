$:.push(File.expand_path("../lib", __FILE__))

# Maintain your gem's version:
require 'docebo_ruby/version'

Gem::Specification.new do |s|
  s.name        = 'docebo'
  s.version     = DoceboRuby::VERSION
  s.date        = '2015-03-14'
  s.summary     = "Ruby wrapper for Docebo LMS."
  s.description = "Docebo is an online LMS."
  s.authors     = ['Cẩm Huỳnh']
  s.email       = 'huynhquancam@gmail.com'
  s.homepage    = 'https://github.com/huynhquancam/docebo_ruby'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.require_paths    = ['lib']

  s.add_dependency 'rest-client', '~> 1.7.3'

  s.add_development_dependency 'rspec', '~> 3.0.0'
  s.add_development_dependency 'webmock'
  s.add_dependency 'activesupport', '>= 3.0.0'
end
