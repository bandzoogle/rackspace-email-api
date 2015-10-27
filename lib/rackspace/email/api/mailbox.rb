class Rackspace::Email::Api::Mailbox < Rackspace::Email::Api::ApiObject

	# @NOTE: there's a whole lot more fields for mailboxes
	# @see http://api-wiki.apps.rackspace.com/api-wiki/index.php/Rackspace_Mailbox_(Rest_API)
	api_attributes [:name, :password, :size, :emailForwardingAddresses]

	api_id_key :name

	DEFAULTS = {
		password: "password12345"
	}

	def accountNumber
		endpoint_opts[:accountNumber]
	end

	def domain
		endpoint_opts[:domain]
	end

	def email
		[name, domain].join("@")
	end

# post '/customers/460896/domains/testapidomain.net/rs/mailboxes/testmailbox/loginToken', {}, 'text/xml'

	def login_token
		url = Rackspace::Email::Api.configuration.base_url.dup +
			"/customers/#{accountNumber}/domains/#{domain}/rs/mailboxes/#{name}/loginToken"		

		conn = Faraday.new(url) do |c|
			c.response :logger, ::Logger.new(STDOUT) #, bodies: true
			c.use Faraday::Request::UrlEncoded
			c.request :url_encoded
			c.adapter Faraday.default_adapter
		end

		x = conn.post do |req|
			req.headers['User-Agent'] = Rackspace::Email::Api.configuration.user_agent
			req.headers['X-Api-Signature'] = Rackspace::Email::Api::Endpoint.new.api_signature
			req.headers['Accept'] = Rackspace::Email::Api.configuration.response_format
		end

		JSON.parse(x.body)["token"]
	end


end
