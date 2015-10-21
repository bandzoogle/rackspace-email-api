class Rackspace::Email::Api::Domains < Rackspace::Email::Api::Endpoint
	def initialize(opts={})
		@customer_id = opts[:customer_id] || "me"
	end

	def endpoint_path
		"customers/#{@customer_id}/domains"
	end

	def create(opts={})
		super(Rackspace::Email::Api::Domain::DEFAULTS.merge(opts))
	end
end
