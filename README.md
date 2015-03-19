DoceboRuby - Ruby wrapper for Decobo LMS API
============================

### Installation

```sh
gem install docebo
```

or add it to Gemfile

```
gem 'docebo', '~> 0.0.1'
```

### Usage


```ruby
api = Docebo::API.new(
  key: 'key', 
  secret: 'secret',
  url: 'your_saas_platform/api'
)

results = api.make_request(
  'user', 
  'authenticate',
  username: 'hello', 
  password: 'hell'
)
```

### TODO

Create User, Courses, etc. API classes.

### Contributions

1. Fork this repository.
2. Create your own feature and spec.
3. Create a pull request.

To run test

```sh
rspec
```
