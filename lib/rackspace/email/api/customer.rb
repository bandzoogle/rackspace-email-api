# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Customer < Rackspace::Email::Api::ApiObject
        api_attributes %i[name accountNumber referenceNumber]
        api_id_key :accountNumber

        # /customers/123456789/domains/example.com
        def domains
          Rackspace::Email::Api::Domains.new(accountNumber)
        end
      end
    end
  end
end
