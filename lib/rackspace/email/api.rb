# frozen_string_literal: true

require 'net/http'

require 'rackspace/email/api/version'
require 'rackspace/email/api/error'
require 'rackspace/email/api/configuration'
require 'rackspace/email/api/endpoint'

require 'rackspace/email/api/api_object'
require 'rackspace/email/api/customer'
require 'rackspace/email/api/customers'

require 'rackspace/email/api/domains'
require 'rackspace/email/api/domain'

require 'rackspace/email/api/mailboxes'
require 'rackspace/email/api/mailbox'

require 'rackspace/email/api/aliases'
require 'rackspace/email/api/alias'

require 'rackspace/email/api/safelist'

require 'addressable/uri'
require 'digest/sha1'
require 'base64'

require 'active_support'
require 'active_support/core_ext/string/inflections'

# http://api-wiki.apps.rackspace.com/api-wiki/index.php/Main_Page#Ruby

require 'logger'

module Rackspace
  module Email
    module Api
      class << self
        attr_accessor :configuration, :logger, :version

        # Call this method to modify defaults in your initializers.
        #
        # @example
        #   Rackspace::Email::Api.configure do |config|
        #     config.user_key = '123456789'     # required
        #     config.api_key = 'dadadasdasdasdadasd'           # required
        #     config.response_format = 'json'         # optional, defaults to json
        #   end
        #
        def configure(_build = true)
          self.configuration ||= Configuration.new
          yield(configuration) if block_given?

          # Configure logger.  Default to use Rails
          self.logger ||= configuration.logger || (defined?(Rails) ? Rails.logger : Logger.new($stdout))

          self.version ||= configuration.version
        end
      end
    end
  end
end
