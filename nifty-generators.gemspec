Gem::Specification.new do |s|
  s.name        = "nifty-generators"
  s.version     = "0.4.6a"
  s.author      = "Ryan Bates"
  s.email       = "ryan@railscasts.com"
  s.homepage    = "http://github.com/ryanb/nifty-generators"
  s.summary     = "A collection of useful Rails generator scripts."
  s.description = "A collection of useful Rails generator scripts for scaffolding, layout files, authentication, and more."

  s.files        = Dir["{lib,test,features,rails_generators}/**/*", "[A-Z]*"]
  s.require_path = "lib"

  s.add_development_dependency 'rspec-rails', '~> 2.6.0'
  s.add_development_dependency 'cucumber', '~> 0.10.0'
  s.add_development_dependency 'rails', '~> 3.1.0'
  s.add_development_dependency 'mocha', '~> 0.9.8'
  s.add_development_dependency 'bcrypt-ruby', '~> 3.0.0'
  s.add_development_dependency 'sqlite3-ruby', '~> 1.3.1'

  s.add_development_dependency 'sass-rails', '~> 3.1.0'
  s.add_development_dependency 'coffee-rails', '~> 3.1.0'
  s.add_development_dependency 'uglifier'
  s.add_development_dependency 'jquery-rails'
  s.add_development_dependency 'turn'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
