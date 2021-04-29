# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class Endpoint
        class << self
          def request_base=(x)
            @@request_path = x
          end

          def request_base
            @@request_path
          end

          def data_class=(x)
            @@data_class = x
          end

          def data_class
            @@data_class
          end
        end

        def endpoint_path
          self.class.request_base
        end

        def base_url
          url = Rackspace::Email::Api.configuration.base_url.dup
          url.path = "#{url.path}/#{endpoint_path}"
          url
        end

        def timestamp
          Time.now.strftime('%Y%m%d%H%M%S')
        end

        # SHA1 Hash:
        # A SHA1 (Secure Hash Algorithm) hash must be applied to a string with the following information:
        # <User Key><User Agent><Timestamp><Secret Key>
        # Note that the 'User Agent' must be the exact same as what is specified in the User-Agent HTTP header. Using the above example data, the string before hashing is:
        # eGbq9/2hcZsRlr1JV1PiRackspace Management Interface20010308143725QHOvchm/40czXhJ1OxfxK7jDHr3t
        # Resulting base-64 SHA1 Hash:
        # 46VIwd66mOFGG8IkbgnLlXnfnkU=
        # Be sure to encode the binary hash, not the hex hash, into base-64. The resulting string should be 28 characters long.
        def hash(ts)
          sig = [
            Rackspace::Email::Api.configuration.user_key,
            Rackspace::Email::Api.configuration.user_agent,
            ts,
            Rackspace::Email::Api.configuration.api_key
          ].join('')

          Base64.encode64(Digest::SHA1.digest(sig))
        end

        # X-Api-Signature Header
        # Format is as follows: <User Key>:<Timestamp>:<SHA1 Hash>
        # Example: eGbq9/2hcZsRlr1JV1Pi:20010317143725:46VIwd66mOFGG8IkbgnLlXnfnkU=
        # Remember to include the colons between the data strings!
        def api_signature
          ts = timestamp
          [
            Rackspace::Email::Api.configuration.user_key,
            ts,
            hash(ts)
          ].join(':')
        end

        def ensure_api_credentials
          if Rackspace::Email::Api.configuration.user_key.nil?
            raise Rackspace::Email::Api::Error,
                  'You must specify a user_key'
          end
          if Rackspace::Email::Api.configuration.api_key.nil?
            raise Rackspace::Email::Api::Error,
                  'You must specify an api_key'
          end
        end

        def url_for(verb, opts = {})
          target = base_url
          id = opts.delete(:id)
          # substitute customer_id, domain_id, etc

          target.query_values = opts unless opts.empty?
          return target if verb == :index

          raise Rackspace::Email::Api::Error, 'You must specify an object_id' if id.nil?

          target.path = [target.path, "#{id}"].join('/')

          target
        end

        def execute(verb, opts = {})
          ensure_api_credentials
          call_api_url(base_url, verb, opts)
        end

        def call_api_url(target_url, verb, opts = {})
          action = ''
          action = opts.delete(:id) if verb != :index

          if verb == :get
            url_params = URI.encode_www_form(opts)
            joiner = target_url.to_s.include?('?') ? '&' : '?'
            target_url = [target_url, url_params].join(joiner)
          end
          puts target_url

          klass = case verb
                  when :get
                    Net::HTTP::Get
                  when :put
                    Net::HTTP::Put
                  when :post
                    Net::HTTP::Post
                  when :delete
                    Net::HTTP::Delete
                  end

          uri = URI(target_url)
          req = klass.new(uri,
                          'User-Agent' => Rackspace::Email::Api.configuration.user_agent,
                          'X-Api-Signature' => api_signature,
                          'Accept' => Rackspace::Email::Api.configuration.response_format)

          req.set_form_data opts if verb != :get

          res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme.casecmp('https').zero?) do |http|
            http.request(req)
          end
        end

        def index(opts = {})
          execute(:get, opts)
        end

        def create(opts = {})
          execute(:post, opts)
        end

        def show(id, opts = {})
          data = execute(:get, { id: id }.merge(opts))
          raw_data = opts.delete(:raw_data) || false
          if raw_data
            data
          else
            self.class.data_class.new(JSON.parse(data.body))
          end
        end

        def update(id, opts = {})
          data = { id: id }.merge(opts)
          execute(:put, data)
        end

        def delete(id, opts = {})
          data = { id: id }.merge(opts)
          execute(:delete, data)
        end
      end
    end
  end
end
