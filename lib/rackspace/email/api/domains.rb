class Rackspace::Email::Api::Domains < Rackspace::Email::Api::Endpoint
	def initialize(customer_id="me")
		@customer_id = customer_id
	end

	def endpoint_path
		"customers/#{@customer_id}/domains"
	end
end
