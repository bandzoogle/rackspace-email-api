class Rackspace::Email::Api::Customer < Rackspace::Email::Api::ApiObject
	api_attributes [:name, :accountNumber, :referenceNumber]

	def domains(*args)
		Rackspace::Email::Api::Domains.send(args)
	end
end
