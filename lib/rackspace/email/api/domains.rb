class Rackspace::Email::Api::Domains < Rackspace::Email::Api::Endpoint
	self.request_base = "customers/%{customer_id}"
end
