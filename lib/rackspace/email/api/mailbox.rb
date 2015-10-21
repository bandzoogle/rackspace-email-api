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

end
