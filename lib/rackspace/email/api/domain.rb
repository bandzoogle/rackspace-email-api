# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Domain < Rackspace::Email::Api::ApiObject
        api_attributes %i[name accountNumber serviceType
                          exchangeBaseMailboxSize exchangeUsedStorage exchangeTotalStorage
                          exchangeExtraStorage exchangeMaxNumMailboxes
                          rsEmailBaseMailboxSize rsEmailMaxNumberMailboxes
                          rsEmailExtraStorage rsEmailUsedStorage
                          aliases
                          archivingServiceEnabled publicFoldersEnabled
                          blackBerryMobileServiceEnabled blackBerryLicenses
                          activeSyncMobileServiceEnabled activeSyncLicenses]

        api_id_key :name

        DEFAULTS = {
          serviceType: 'rsemail',
          rsEmailMaxNumberMailboxes: 10,
          rsEmailBaseMailboxSize: 25 * 1024 # size in mb
        }.freeze

        # /customers/123456789/domains/example.com/mailboxes
        def mailboxes
          Rackspace::Email::Api::Mailboxes.new(accountNumber, name)
        end

        def safelist
          Rackspace::Email::Api::Safelists.new(accountNumber, name)
        end
      end
    end
  end
end
