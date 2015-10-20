class Rackspace::Email::Api::Mailbox < Rackspace::Email::Api::ApiObject

	# @NOTE: there's a whole lot more fields for mailboxes
	# @see http://api-wiki.apps.rackspace.com/api-wiki/index.php/Rackspace_Mailbox_(Rest_API)
	api_attributes [:password, :size, :emailForwardingAddresses]

	api_id_key :name
end
