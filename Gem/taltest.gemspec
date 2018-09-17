require 'date'

Gem::Specification.new do |s|
  s.name        = 'taltest'
  s.version     = '0.0.3'
  s.date        = Date.today
  s.summary     = "Hola Test!"
  s.executables << 'hola'
  s.description = "A simple hello world gem"
  s.authors     = ["Tal Zion"]
  s.email       = 'talezion@gmail.com'
  s.files       = ["lib/taltest.rb", "lib/hola/Translator.rb"]
  s.homepage    =
    'http://rubygems.org/gems/hola'
  s.license       = 'MIT'
end
