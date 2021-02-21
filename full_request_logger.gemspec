require_relative "lib/full_request_logger/version"

Gem::Specification.new do |s|
  s.name     = 'full_request_logger'
  s.version  = FullRequestLogger::VERSION
  s.authors  = 'David Heinemeier Hansson'
  s.email    = 'david@basecamp.com'
  s.summary  = 'Make full request logs accessible via web UI'
  s.homepage = 'https://github.com/basecamp/full_request_logger'
  s.license  = 'MIT'

  s.required_ruby_version = '>= 2.6.0'

  s.add_dependency 'rails', '>= 5.0.0'
  s.add_dependency 'redis', '>= 4.0'
  s.add_dependency 'elasticsearch-persistence'

  s.add_development_dependency 'bundler', '~> 1.17'
  s.add_development_dependency "sqlite3"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = `git ls-files -- test/*`.split("\n")
end
