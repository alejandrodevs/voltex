$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "voltex/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "voltex"
  s.version     = Voltex::VERSION
  s.authors     = ["ErickFabian"]
  s.email       = ["fabianerickalfonso@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Voltex."
  s.description = "TODO: Description of Voltex."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.1"

  s.add_development_dependency "sqlite3"
end
