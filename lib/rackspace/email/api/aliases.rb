class Rackspace::Email::Api::Aliases < Rackspace::Email::Api::Endpoint
	def initialize(opts={})
		@customer_id = opts[:customer_id] || "me"
		@domain = opts[:domain]

		raise Rackspace::Email::Api::Error.new("You must specify a domain") if @domain.nil?
	end

	def endpoint_path
		"customers/#{@customer_id}/domains/#{@domain}/rs/aliases"
	end


	def create(opts={})
		opts[:aliasEmails] = [ opts[:aliasEmails] ].
			flatten.
			collect { |z| z.split }.flatten

		opts[:aliasEmails] = opts[:aliasEmails].join(", ")

		super(opts)
	end

	def update(opts={})
		opts[:aliasEmails] = [ opts[:aliasEmails] ].
			flatten.
			collect { |z| z.split }.flatten

		opts[:aliasEmails] = opts[:aliasEmails].join(", ")

		super(opts)
	end
end
