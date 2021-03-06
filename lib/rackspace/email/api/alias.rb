# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Alias < Rackspace::Email::Api::ApiObject
        # @NOTE: there's a whole lot more fields for mailboxes
        # @see http://api-wiki.apps.rackspace.com/api-wiki/index.php/Rackspace_Mailbox_(Rest_API)
        api_attributes %i[name aliasEmails]

        api_id_key :name

        def accountNumber
          endpoint_opts[:accountNumber]
        end

        def domain
          endpoint_opts[:domain]
        end

        def email
          [name, domain].join('@')
        end
      end
    end
  end
end
