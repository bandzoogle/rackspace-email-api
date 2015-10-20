require "spec_helper"

describe Rackspace::Email::Api::Domains do
	before(:each) do
		Rackspace::Email::Api.configure do |config|
			config.user_key = "user_key"
			config.api_key = "api_key"
		end
	end

	let(:endpoint) { Rackspace::Email::Api::Domains.new(12345) }

	describe "index" do
		it "should work" do
			url = endpoint.url_for(:index).to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers/12345/domains")
		end
	end

	describe "show" do
		it "should work" do
			url = endpoint.url_for(:show, id:"domain.com").to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers/12345/domains/domain.com")
		end
	end
end