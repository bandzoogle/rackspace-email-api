require "spec_helper"

describe Rackspace::Email::Api::Customers do
	before(:each) do
		Rackspace::Email::Api.configure do |config|
			config.user_key = "user_key"
			config.api_key = "api_key"
		end
	end

	let(:endpoint) { Rackspace::Email::Api::Customers.new }

	describe "index" do
		it "should work" do
			url = endpoint.url_for(:index).to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers")
		end

		it "passes opts" do
			url = endpoint.url_for(:index, {:size => 100, offset: 10}).to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers?offset=10&size=100")
		end
	end

	describe "show" do
		it "should work" do
			url = endpoint.url_for(:show, id:12345).to_s
			expect(url).to eql("https://api.emailsrvr.com/v1/customers/12345")
		end
	end
end