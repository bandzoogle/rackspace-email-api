require "spec_helper"

describe Rackspace::Email::Api::Mailbox do
	describe "from_hash" do
		let(:mailbox) {
			Rackspace::Email::Api::Mailbox.from_hash({
				name:"foo"
			},
			{
				domain: "domain.com",
				accountNumber: 12345
			})
		} 

		it { expect(mailbox.name).to eql("foo") }
		it { expect(mailbox.email).to eql("foo@domain.com") }
		it { expect(mailbox.domain).to eql("domain.com") }
		it { expect(mailbox.accountNumber).to eql(12345) }
	end


	describe "initialize" do
		let(:mailbox) {
			Rackspace::Email::Api::Mailbox.new({
			name:"foo"
		},
		{
				domain: "domain.com",
				accountNumber: 12345
			})
		}

		it { expect(mailbox.name).to eql("foo") }
		it { expect(mailbox.email).to eql("foo@domain.com") }
		it { expect(mailbox.domain).to eql("domain.com") }
		it { expect(mailbox.accountNumber).to eql(12345) }
	end

end