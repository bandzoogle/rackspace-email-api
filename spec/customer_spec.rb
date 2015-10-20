require "spec_helper"

describe Rackspace::Email::Api::Customer do
	describe "from_hash" do
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


	describe "initialize" do
		context "without an id" do
			let(:customer) {
				Rackspace::Email::Api::Customer.new({
					name: "Name",
					accountNumber: 12345,
					referenceNumber: 567890
				})
			}

			it { expect(customer.name).to eql("Name") }
			it { expect(customer.accountNumber).to eql(12345) }
			it { expect(customer.referenceNumber).to eql(567890) }
		end

		context "with an id" do
			let(:customer) {
				Rackspace::Email::Api::Customer.new(
					420,
				{
					name: "Name",
					accountNumber: 12345,
					referenceNumber: 567890
				})
			} 

			it { expect(customer.name).to eql("Name") }
			it { expect(customer.accountNumber).to eql(420) }
			it { expect(customer.referenceNumber).to eql(567890) }
		end
	end
end