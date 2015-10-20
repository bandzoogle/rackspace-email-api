class Rackspace::Email::Api::ApiObject
	attr_accessor :data
	attr_accessor :endpoint_opts

	class << self
		attr_accessor :_api_attributes
		attr_accessor :_api_id_key

		def	api_attributes attrs
			self._api_attributes = attrs
			attrs.each { |a|
				attr_accessor a
			}
		end

		def api_id_key k
			self._api_id_key = k.to_sym
		end

		def from_hash(data, endpoint_opts={})
			obj = self.new
			obj.populate(data, endpoint_opts)
		end
	end

	def initialize(id = nil, opts={}, endpoint_opts={})
		if id.is_a?(Hash)
			endpoint_opts = opts
			opts = id
			id = nil
		end

		opts[self.class._api_id_key] = id unless id.nil?
		populate(opts, endpoint_opts)
	end

	def populate(h, endpoint_opts={})
		self.data = h.dup
		self.class._api_attributes.each { |a|
			v = h[a]
			self.send("#{a}=".to_sym, v)
		}

		self.endpoint_opts = endpoint_opts

		self
	end

	def endpoint_class
		self.class.to_s.pluralize.constantize
	end

	def endpoint
		endpoint_class.new
	end
end