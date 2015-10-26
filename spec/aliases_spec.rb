require "spec_helper"

describe Rackspace::Email::Api::Aliases do
	before(:each) do
		Rackspace::Email::Api.configure do |config|
			config.user_key = "user_key"
			config.api_key = "api_key"
		end
	end

	let(:endpoint) { Rackspace::Email::Api::Aliases.new(customer_id:12345, domain:"domain.com") }

	describe "index" do
		it "should work" do
			url = endpoint.url_for(:index).to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers/12345/domains/domain.com/rs/aliases")
		end
	end

	describe "show" do
		it "should work" do
			url = endpoint.url_for(:show, id:"foo").to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers/12345/domains/domain.com/rs/aliases/foo")
		end
	end


	describe "delete" do
		it "should work" do
			url = endpoint.url_for(:delete, id:"foo").to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers/12345/domains/domain.com/rs/aliases/foo")
		end
	end
end