# frozen_string_literal: true

module Rackspace
  module Email
    module Api
      class ApiObject
        attr_accessor :data, :endpoint_opts

        class << self
          attr_accessor :_api_attributes, :_api_id_key

          def	api_attributes(attrs)
            self._api_attributes = attrs
            attrs.each do |a|
              attr_accessor a
            end
          end

          def api_id_key(k)
            self._api_id_key = k.to_sym
          end

          def from_hash(data, endpoint_opts = {})
            obj = new
            obj.populate(data, endpoint_opts)
          end
        end

        def initialize(id = nil, opts = {}, endpoint_opts = {})
          if id.is_a?(Hash)
            endpoint_opts = opts
            opts = id
            id = nil
          end

          opts[self.class._api_id_key] = id unless id.nil?
          populate(opts, endpoint_opts)
        end

        def populate(h, endpoint_opts = {})
          self.data = h.dup
          self.class._api_attributes.each do |a|
            v = h[a]
            send("#{a}=".to_sym, v)
          end

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
    end
  end
end
