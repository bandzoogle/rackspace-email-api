# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require 'bundler/setup'
Bundler.require

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }
