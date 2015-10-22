require "spec_helper"

describe Rackspace::Email::Api::Alias do
	describe "from_hash" do
		let(:_alias) {
			Rackspace::Email::Api::Alias.from_hash({
				name:"foo"
			},
			{
				domain: "domain.com",
				accountNumber: 12345
			})
		} 

		it { expect(_alias.name).to eql("foo") }
		it { expect(_alias.email).to eql("foo@domain.com") }
		it { expect(_alias.domain).to eql("domain.com") }
		it { expect(_alias.accountNumber).to eql(12345) }
	end


	describe "initialize" do
		let(:_alias) {
			Rackspace::Email::Api::Alias.new({
			name:"foo"
		},
		{
				domain: "domain.com",
				accountNumber: 12345
			})
		}

		it { expect(_alias.name).to eql("foo") }
		it { expect(_alias.email).to eql("foo@domain.com") }
		it { expect(_alias.domain).to eql("domain.com") }
		it { expect(_alias.accountNumber).to eql(12345) }
	end

end