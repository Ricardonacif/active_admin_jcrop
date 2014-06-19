$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin_jcrop/version"
require 'capybara/rspec'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_admin_jcrop"
  s.version     = ActiveAdminJcrop::VERSION
  s.authors     = ["Ricardo Nacif"]
  s.email       = ["nacif.ricardo@gmail.com"]
  s.homepage    = "https://github.com/Ricardonacif/active_admin_jcrop"
  s.summary     = "Jcrop plugin for ActiveAdmin, enable image cropping solution on image fields"
  s.description = "Jcrop plugin for ActiveAdmin, enable image cropping solution on image fields"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.2.0"
  s.add_dependency "mini_magick"
  
  # Dummy
  s.add_development_dependency "mysql2"
  s.add_development_dependency "carrierwave"
  s.add_development_dependency "rmagick"

  
  # Tests
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency 'factory_girl_rails', '~> 1.0'
  s.add_development_dependency "pry"
  
end