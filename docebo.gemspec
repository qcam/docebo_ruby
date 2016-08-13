$:.push(File.expand_path("../lib", __FILE__))

# Maintain your gem's version:
require 'docebo/version'

Gem::Specification.new do |s|
  s.name        = 'docebo'
  s.version     = Docebo::VERSION
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

  s.add_dependency 'httparty', '~> 0.14'

  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'webmock', '~> 2.1'
  s.add_development_dependency 'vcr', '~> 3.0'
end
