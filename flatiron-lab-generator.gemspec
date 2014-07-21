# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flatiron-lab-generator/version.rb'

Gem::Specification.new do |spec|
  spec.name          = "flatiron-lab-generator"
  spec.version       = FlatironLabGenerator::VERSION
  spec.authors       = ["Arel English", "Amanda Himmelstoss"]
  spec.email         = ["arel@flatironschool.com", "amanda@flatironschool.com"]
  spec.summary       = %q{A lab generator}
  spec.description   = %q{Generates labs for The Flatiron School based on a set of lab templates}
  spec.homepage      = "http://www.flatironschool.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "pry"
end
