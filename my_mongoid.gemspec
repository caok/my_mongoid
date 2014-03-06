# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'my_mongoid/version'

Gem::Specification.new do |spec|
  spec.name          = "my_mongoid"
  spec.version       = MyMongoid::VERSION
  spec.authors       = ["caok"]
  spec.email         = ["caok1231@gmail.com"]
  spec.description   = %q{my mongodb ruby wrapper}
  spec.summary       = %q{mongodb wrapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency("moped", ["~> 2.0.beta6"])
  spec.add_dependency("active_support")
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
