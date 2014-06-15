$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin_jcrop/version"

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

  s.add_dependency "rails", "~> 4.1.1"
  s.add_dependency "mini_magick"
  
  s.add_development_dependency "mysql2"
  s.add_development_dependency "carrierwave"
  s.add_development_dependency "rmagick"
  s.add_development_dependency "devise"
  s.add_development_dependency "pry"

end