# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'identification_number/version'

Gem::Specification.new do |gem|
  gem.name          = "identification_number"
  gem.version       = IdentificationNumber::VERSION
  gem.authors       = ["Martin Häger"]
  gem.email         = ["martin.hager@minmb.se"]
  gem.description   = %q{Validate person identification numbers}
  gem.summary       = %q{Validate person identification numbers (e.g. Social Security Numbers)}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "luhnacy"
  gem.add_development_dependency "rspec"
end
