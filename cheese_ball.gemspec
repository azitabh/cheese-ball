$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "cheese_ball/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "cheese_ball"
  s.version     = CheeseBall::VERSION
  s.authors     = ["Azitabh Ajit"]
  s.email       = ["azitabh@gmail.com"]
  s.homepage    = "http://www.abc.com"
  s.summary     = "Awesome"
  s.description = "Awesome Application"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end
