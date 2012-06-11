$:.push File.expand_path("../lib", __FILE__)
require 'flarg/version'

Gem::Specification.new do |s|
  s.name          = "flarg"
  s.summary       = "Add quick configuration to rails projects"
  s.description   = "A gem that adds quick configuration DSL to rails projects"

  s.homepage          = "https://github.com/brundage/flarg"
  s.rubyforge_project = "flarg"

  s.add_dependency 'activesupport'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'  # Why doesn't guard-rspec depend on rspec?

  s.authors       = ["Dean Brundage"]
  s.email         = ["dean@newrepublicbrewing.com"]

  s.files         = [ 'README.md', 'lib/flarg.rb', 'lib/flarg/version.rb' ]
  s.test_files    = [ 'spec/flarg_spec.rb' ]
  s.require_paths = ["lib"]

  s.platform      = Gem::Platform::RUBY
  s.version       = Flarg::VERSION
end
