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

        def post_url(url)
          uri = URI(url)
          req = Net::HTTP::Post.new(uri,
                                    'User-Agent' => Rackspace::Email::Api.configuration.user_agent,
                                    'X-Api-Signature' => Rackspace::Email::Api::Endpoint.new.api_signature,
                                    'Accept' => Rackspace::Email::Api.configuration.response_format)

          res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme.casecmp('https').zero?) do |http|
            http.request(req)
          end

          JSON.parse(res.body)
        end

        def disable
          url = [
            Rackspace::Email::Api.configuration.base_url.dup,
            "customers/#{accountNumber}/disable"
          ].join('/')
          post_url(url)
        end

        def enable
          url = [
            Rackspace::Email::Api.configuration.base_url.dup,
            "customers/#{accountNumber}/enable"
          ].join('/')
          post_url(url)
        end

      end
    end
  end
end
