# frozen_string_literal: true

require 'spec_helper'

describe Rackspace::Email::Api::Alias do
  describe 'from_hash' do
    let(:_alias) do
      Rackspace::Email::Api::Alias.from_hash({
                                               name: 'foo'
                                             },
                                             {
                                               domain: 'domain.com',
                                               accountNumber: 12_345
                                             })
    end

    it { expect(_alias.name).to eql('foo') }
    it { expect(_alias.email).to eql('foo@domain.com') }
    it { expect(_alias.domain).to eql('domain.com') }
    it { expect(_alias.accountNumber).to eql(12_345) }
  end

  describe 'initialize' do
    let(:_alias) do
      Rackspace::Email::Api::Alias.new({
                                         name: 'foo'
                                       },
                                       {
                                         domain: 'domain.com',
                                         accountNumber: 12_345
                                       })
    end

    it { expect(_alias.name).to eql('foo') }
    it { expect(_alias.email).to eql('foo@domain.com') }
    it { expect(_alias.domain).to eql('domain.com') }
    it { expect(_alias.accountNumber).to eql(12_345) }
  end
end
