class Rackspace::Email::Api::ApiObject
	attr_accessor :data

	class << self
		def	api_attributes attrs
			@@api_attributes = attrs
			attrs.each { |a|
				attr_accessor a
			}
		end

		def api_id_key k
			@@api_id_key = k.to_sym
		end

		def from_hash(h)
			obj = self.new
			obj.populate(h)
		end
	end

	def initialize(id = nil, opts={})
		if id.is_a?(Hash)
			opts = id
			id = nil
		end

		opts[@@api_id_key] = id unless id.nil?
		populate(opts)
	end

	def populate(h)
		self.data = h.dup

		@@api_attributes.each { |a|
			v = h[a]
			self.send("#{a}=".to_sym, v)
		}

		self
	end

end