# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Aliases < Rackspace::Email::Api::Endpoint
        def initialize(opts = {})
          @customer_id = opts[:customer_id] || 'me'
          @domain = opts[:domain]

          raise Rackspace::Email::Api::Error, 'You must specify a domain' if @domain.nil?
        end

        def endpoint_path
          "customers/#{@customer_id}/domains/#{@domain}/rs/aliases"
        end

        def create(opts = {})
          opts[:aliasEmails] = [opts[:aliasEmails]]
                               .flatten
                               .collect(&:split).flatten

          opts[:aliasEmails] = opts[:aliasEmails].join(', ')

          super(opts)
        end

        def update(id, opts = {})
          opts[:aliasEmails] = [opts[:aliasEmails]]
                               .flatten
                               .collect(&:split).flatten

          opts[:aliasEmails] = opts[:aliasEmails].join(', ')

          super(id, opts)
        end
      end
    end
  end
end
