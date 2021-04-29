# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Mailboxes < Rackspace::Email::Api::Endpoint
        def initialize(opts = {})
          @customer_id = opts[:customer_id] || 'me'
          @domain = opts[:domain]

          raise Rackspace::Email::Api::Error, 'You must specify a domain' if @domain.nil?
        end

        def endpoint_path
          "customers/#{@customer_id}/domains/#{@domain}/rs/mailboxes"
        end

        def create(opts = {})
          super(Rackspace::Email::Api::Mailbox::DEFAULTS.merge(opts))
        end
      end
    end
  end
end
