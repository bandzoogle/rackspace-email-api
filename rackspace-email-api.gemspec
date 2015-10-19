# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rackspace/email/api/version'

Gem::Specification.new do |spec|
  spec.name          = "rackspace-email-api"
  spec.version       = Rackspace::Email::Api::VERSION
  spec.authors       = ["Colin Mitchell"]
  spec.email         = ["muffinista@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'logger'
  spec.add_development_dependency 'pry'
  spec.add_dependency "faraday", "~> 0.9.1"
  spec.add_dependency 'addressable', '>=2.2.4'
  spec.add_dependency "activesupport"
end
