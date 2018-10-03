class Rackspace::Email::Api::Domain < Rackspace::Email::Api::ApiObject
	api_attributes [:name, :accountNumber, :serviceType,
	 :exchangeBaseMailboxSize, :exchangeUsedStorage, :exchangeTotalStorage,
	 :exchangeExtraStorage, :exchangeMaxNumMailboxes,
	 :rsEmailBaseMailboxSize, :rsEmailMaxNumberMailboxes,
	 :rsEmailExtraStorage, :rsEmailUsedStorage,
	 :aliases,
	 :archivingServiceEnabled, :publicFoldersEnabled,
	 :blackBerryMobileServiceEnabled,:blackBerryLicenses,
	 :activeSyncMobileServiceEnabled, :activeSyncLicenses]

	api_id_key :name

	DEFAULTS = {
		serviceType:'rsemail',
		rsEmailMaxNumberMailboxes:10,
		rsEmailBaseMailboxSize: 25 * 1024 # size in mb
	}

	# /customers/123456789/domains/example.com/mailboxes
	def mailboxes
		Rackspace::Email::Api::Mailboxes.new(self.accountNumber, self.name)
	end

	def safelist
		Rackspace::Email::Api::Safelists.new(self.accountNumber, self.name)
	end
end
