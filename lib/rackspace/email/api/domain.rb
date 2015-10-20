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

	# /customers/123456789/domains/example.com/mailboxes
	def mailboxes
		Rackspace::Email::Api::Mailboxes.new(self.accountNumber, self.name)
	end
end
