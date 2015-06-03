$:.push File.expand_path('../lib', __FILE__)
require 'voltex/version'

Gem::Specification.new do |s|
  s.name        = 'voltex'
  s.version     = Voltex::VERSION
  s.authors     = ['Erick Fabian', 'Alejandro Gutiérrez']
  s.email       = ['fabianerickalfonso@gmail.com', 'alejandrodevs@gmail.com']
  s.homepage    = ''
  s.summary     = 'Dynamic permissions authorization.'
  s.description = 'This engine aims to provide an easy way to work with dynamic permissions.'
  s.license     = 'MIT'
  s.files       = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '~> 4.2.1'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails', '~> 3.2'
  s.add_development_dependency 'cucumber', '~> 2.0.0'
  s.add_development_dependency 'aruba', '~> 0.6.2'
end
