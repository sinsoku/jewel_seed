# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jewel_seed/version'

Gem::Specification.new do |spec|
  spec.name          = "jewel_seed"
  spec.version       = JewelSeed::VERSION
  spec.authors       = ["sinsoku"]
  spec.email         = ["sinsoku.listy@gmail.com"]
  spec.description   = 'JewelSeed is best seed manager for Rails'
  spec.summary       = 'JewelSeed is best seed manager for Rails'
  spec.homepage      = "https://github.com/sinsoku/jewel_seed"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.0.0"
  spec.add_dependency "activerecord", "~> 4.0.0"
  spec.add_dependency "activerecord-import"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
