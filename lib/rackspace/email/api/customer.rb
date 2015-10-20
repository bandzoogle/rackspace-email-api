class Rackspace::Email::Api::Customer < Rackspace::Email::Api::ApiObject
	api_attributes [:name, :accountNumber, :referenceNumber]
	api_id_key :accountNumber

	# /customers/123456789/domains/example.com
	def domains(*args)
		Rackspace::Email::Api::Domains.send(self.accountNumber, args)
	end
end
