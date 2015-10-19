class Rackspace::Email::Api::ApiObject
	class << self
		attr_accessor :data

		def	api_attributes attrs
			@@api_attributes = attrs
			attrs.each { |a|
				attr_accessor a
			}
		end

		def from_hash(h)
			obj = self.new
			obj.data = h.dup

			@@api_attributes.each { |a|
				v = h[a]
				obj.send("#{a}=".to_sym, v)
			}

			obj
		end
	end

	attr_accessor :data
end