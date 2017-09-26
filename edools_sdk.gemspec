Gem::Specification.new do |s|
  s.name        = 'edools_sdk'
  s.version     = '0.0.1'
  s.date        = '2017-10-25'
  s.summary     = "SDK for edools platform."
  s.description = "A simple sdk to access edools platform."
  s.authors     = ["Lucas Vieira"]
  s.email       = 'lucasvieira.dev@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    =
    'http://rubygems.org/gems/edools_sdk'
  s.license       = 'MIT'

  s.add_runtime_dependency 'http', '~> 2.2'
end