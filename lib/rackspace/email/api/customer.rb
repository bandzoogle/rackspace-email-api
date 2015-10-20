class Rackspace::Email::Api::Customer < Rackspace::Email::Api::ApiObject
	api_attributes [:name, :accountNumber, :referenceNumber]
	api_id_key :accountNumber

	# /customers/123456789/domains/example.com
	def domains
		Rackspace::Email::Api::Domains.new(self.accountNumber)
	end
end
