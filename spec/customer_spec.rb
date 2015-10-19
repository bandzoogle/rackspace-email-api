require "spec_helper"

describe Rackspace::Email::Api::Customer do
	describe "data attributes" do
		let(:customer) {
			Rackspace::Email::Api::Customer.from_hash({
				name: "Name",
				accountNumber: 12345,
				referenceNumber: 567890
			})
		} 

		it { expect(customer.name).to eql("Name") }
		it { expect(customer.accountNumber).to eql(12345) }
		it { expect(customer.referenceNumber).to eql(567890) }

	end
end