# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clio_client/version'

Gem::Specification.new do |spec|
  spec.name          = "clio_client"
  spec.version       = ClioClient::VERSION
  spec.authors       = ["Kyle d'Oliveira"]
  spec.email         = ["kyle@goclio.com"]
  spec.description   = "Api client for Clio"
  spec.summary       = "A simple ruby library to interact with Clio's Api"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "debugger"

end
