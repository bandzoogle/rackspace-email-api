class Rackspace::Email::Api::Alias < Rackspace::Email::Api::ApiObject

	# @NOTE: there's a whole lot more fields for mailboxes
	# @see http://api-wiki.apps.rackspace.com/api-wiki/index.php/Rackspace_Mailbox_(Rest_API)
	api_attributes [:name, :aliasEmails]

	api_id_key :name

	def emails

	end
end
