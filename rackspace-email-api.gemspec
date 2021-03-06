# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rackspace/email/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'rackspace-email-api'
  spec.version       = Rackspace::Email::Api::VERSION
  spec.authors       = ['Colin Mitchell']
  spec.email         = ['muffinista@gmail.com']
  spec.summary       = 'ruby interface to rackspace email API'
  spec.description   = 'ruby interface to rackspace email API'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'logger'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency('simplecov', ['>= 0.15'])

  spec.add_dependency 'activesupport'
  spec.add_dependency 'addressable', '>=2.2.4'
end
