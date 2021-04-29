# frozen_string_literal: true

require 'spec_helper'

describe Rackspace::Email::Api::Domain do
  describe 'from_hash' do
    let(:customer) do
      Rackspace::Email::Api::Domain.from_hash({
                                                name: 'domain.com',
                                                accountNumber: 12_345
                                              })
    end

    it { expect(customer.name).to eql('domain.com') }
    it { expect(customer.accountNumber).to eql(12_345) }
  end

  describe 'initialize' do
    context 'without an id' do
      let(:customer) do
        Rackspace::Email::Api::Domain.new({
                                            name: 'domain.com',
                                            accountNumber: 12_345
                                          })
      end

      it { expect(customer.name).to eql('domain.com') }
      it { expect(customer.accountNumber).to eql(12_345) }
    end

    context 'with an id' do
      let(:customer) do
        Rackspace::Email::Api::Domain.new(
          'domain.com',
          {
            name: 'foo.com',
            accountNumber: 12_345
          }
        )
      end

      it { expect(customer.name).to eql('domain.com') }
      it { expect(customer.accountNumber).to eql(12_345) }
    end
  end
end
