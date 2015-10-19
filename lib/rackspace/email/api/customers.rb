class Rackspace::Email::Api::Customers < Rackspace::Email::Api::Endpoint
	self.request_base = "customers"
	self.data_class = Rackspace::Email::Api::Customer
end
