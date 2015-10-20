module Rackspace::Email::Api
  class Configuration
    require 'rackspace/email/api/version'

    attr_accessor :version

    attr_accessor :user_key
    attr_accessor :api_key

    # Response format can be 'json' (default) or 'xml'
    attr_accessor :response_format

    attr_accessor :scheme
    attr_accessor :host

    attr_accessor :user_agent

    attr_accessor :logger

    # Defaults go in here..
    def initialize
      @response_format = 'application/json'
      @scheme = 'https'
      @host = 'api.emailsrvr.com'
      @user_agent = "ruby-#{Rackspace::Email::Api::VERSION}"
      @version = 'v1'

      # # Build the default set of resource names from the filenames of the API documentation
      # begin
      #   api_docs_path = File.join(File.dirname(__FILE__), "../../api_docs")
      #   @resource_names = `find #{api_docs_path} -name '*.json'`.split("\n").map {|f| f.split("/").last.sub('.json', '') }.sort
      #   true
      # rescue
      #   raise "Problem loading the resource files in ./api_docs/"
      # end
    end

    def base_url
      Addressable::URI.new(
        :scheme => self.scheme,
        :host => self.host,
        :path => self.version
      )
    end

    def clear
      initialize
    end
  end

end
