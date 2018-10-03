class Rackspace::Email::Api::Safelist < Rackspace::Email::Api::Endpoint
	def initialize(opts={})
		@customer_id = opts[:customer_id] || "me"
		@domain = opts[:domain]

		raise Rackspace::Email::Api::Error.new("You must specify a domain") if @domain.nil?
	end

	def endpoint_path
		"customers/#{@customer_id}/domains/#{@domain}/spam/safelist"
	end

  # http://api-wiki.apps.rackspace.com/api-wiki/index.php?title=Domain_Spam_(Rest_API)#Add_Safelist
  def add(email)
    url = [ base_url, email ].join('/')
    call_api_url(url, :post)
  end

  def remove(email)
    url = [ base_url, email ].join('/')
    delete(url)
  end
end
