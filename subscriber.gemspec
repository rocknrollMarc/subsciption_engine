$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "subscriber/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "subscriber"
  s.version     = Subscriber::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Subscriber."
  s.description = "TODO: Description of Subscriber."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "pg"
  s.add_dependency "apartment", "0.24.3"

  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "bcrypt", "3.1.7"
  s.add_development_dependency "warden", "1.2.3"
  s.add_development_dependency "dynamic_form"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "factory_girl"


end
