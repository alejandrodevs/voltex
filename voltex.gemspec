$:.push File.expand_path('../lib', __FILE__)
require 'voltex/version'

Gem::Specification.new do |s|
  s.name        = 'voltex'
  s.version     = Voltex::VERSION
  s.authors     = ['Erick Fabian', 'Alejandro Gutiérrez']
  s.email       = ['fabianerickalfonso@gmail.com', 'alejandrodevs@gmail.com']
  s.homepage    = 'https://github.com/SyeSoftware/voltex'
  s.summary     = 'Dynamic permissions authorization.'
  s.description = 'This engine aims to provide an easy way to work with dynamic permissions.'
  s.license     = 'MIT'
  s.files       = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'rails', '>= 4.0'
  s.add_dependency 'request_store', '~> 1.3'

  s.add_development_dependency 'sqlite3', '~> 1.3'
  s.add_development_dependency 'rspec-rails', '~> 3.4'
  s.add_development_dependency 'cucumber', '~> 2.3'
  s.add_development_dependency 'aruba', '~> 0.14'
  s.add_development_dependency 'cancan', '~> 1.6'
end
