class Rackspace::Email::Api::Mailboxes < Rackspace::Email::Api::Endpoint
	def initialize(customer_id="me", domain)
		@customer_id = customer_id
		@domain = domain
	end

	def endpoint_path
		"customers/#{@customer_id}/domains/#{@domain}/rs/mailboxes"
	end
end
