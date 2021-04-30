# frozen_string_literal: true

require 'spec_helper'

describe Rackspace::Email::Api::Mailbox do
  describe 'from_hash' do
    let(:mailbox) do
      Rackspace::Email::Api::Mailbox.from_hash({
                                                 name: 'foo'
                                               },
                                               {
                                                 domain: 'domain.com',
                                                 accountNumber: 12_345
                                               })
    end

    it { expect(mailbox.name).to eql('foo') }
    it { expect(mailbox.email).to eql('foo@domain.com') }
    it { expect(mailbox.domain).to eql('domain.com') }
    it { expect(mailbox.accountNumber).to eql(12_345) }
  end

  describe 'initialize' do
    let(:mailbox) do
      Rackspace::Email::Api::Mailbox.new({
                                           name: 'foo'
                                         },
                                         {
                                           domain: 'domain.com',
                                           accountNumber: 12_345
                                         })
    end

    it { expect(mailbox.name).to eql('foo') }
    it { expect(mailbox.email).to eql('foo@domain.com') }
    it { expect(mailbox.domain).to eql('domain.com') }
    it { expect(mailbox.accountNumber).to eql(12_345) }
  end
end
