# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Customers < Rackspace::Email::Api::Endpoint
        self.request_base = 'customers'
        self.data_class = Rackspace::Email::Api::Customer
      end
    end
  end
end
