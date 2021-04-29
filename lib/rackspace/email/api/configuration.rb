# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Configuration
        require 'rackspace/email/api/version'

        attr_accessor :version, :user_key, :api_key, :scheme, :host, :user_agent, :logger

        # Response format can be 'json' (default) or 'xml'
        attr_accessor :response_format

        # Defaults go in here..
        def initialize
          @response_format = 'application/json'
          @scheme = 'https'
          @host = 'api.emailsrvr.com'
          @user_agent = "ruby-#{Rackspace::Email::Api::VERSION}"
          @version = 'v1'
        end

        def base_url
          Addressable::URI.new(
            scheme: scheme,
            host: host,
            path: version
          )
        end

        def clear
          initialize
        end
      end
    end
  end
end
