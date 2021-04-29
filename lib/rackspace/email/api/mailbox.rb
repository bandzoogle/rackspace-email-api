# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Mailbox < Rackspace::Email::Api::ApiObject
        # @NOTE: there's a whole lot more fields for mailboxes
        # @see http://api-wiki.apps.rackspace.com/api-wiki/index.php/Rackspace_Mailbox_(Rest_API)
        api_attributes %i[name password size emailForwardingAddresses]

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

        def login_token
          url = [
            Rackspace::Email::Api.configuration.base_url.dup,
            "customers/#{accountNumber}/domains/#{domain}/rs/mailboxes/#{name}/loginToken"
          ].join('/')

          uri = URI(url)
          req = Net::HTTP::Post.new(uri,
                                    'User-Agent' => Rackspace::Email::Api.configuration.user_agent,
                                    'X-Api-Signature' => Rackspace::Email::Api::Endpoint.new.api_signature,
                                    'Accept' => Rackspace::Email::Api.configuration.response_format)

          res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme.casecmp('https').zero?) do |http|
            http.request(req)
          end

          res.body

          JSON.parse(res.body)['token']
        end
      end
    end
  end
end
