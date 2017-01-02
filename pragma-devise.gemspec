$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'pragma/devise/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'pragma-devise'
  s.version     = Pragma::Devise::VERSION
  s.authors     = ['Alessandro Desantis']
  s.email       = ['desa.alessandro@gmail.com']
  s.homepage    = 'https://github.com/pragmarb/pragma-devise'
  s.summary     = 'Devise integration with the Pragma architecture.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '>= 4.2', '< 6'

  s.add_dependency 'pragma-rails', '~> 0.1'
  s.add_dependency 'knock', '~> 2.0'
  s.add_dependency 'devise', '~> 4.2'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-rspec'
  s.add_development_dependency 'coveralls'
end
