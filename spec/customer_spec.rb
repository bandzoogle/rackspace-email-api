# frozen_string_literal: true

require 'spec_helper'

describe Rackspace::Email::Api::Customer do
  describe 'from_hash' do
    let(:customer) do
      Rackspace::Email::Api::Customer.from_hash({
                                                  name: 'Name',
                                                  accountNumber: 12_345,
                                                  referenceNumber: 567_890
                                                })
    end

    it { expect(customer.name).to eql('Name') }
    it { expect(customer.accountNumber).to eql(12_345) }
    it { expect(customer.referenceNumber).to eql(567_890) }
  end

  describe 'initialize' do
    context 'without an id' do
      let(:customer) do
        Rackspace::Email::Api::Customer.new({
                                              name: 'Name',
                                              accountNumber: 12_345,
                                              referenceNumber: 567_890
                                            })
      end

      it { expect(customer.name).to eql('Name') }
      it { expect(customer.accountNumber).to eql(12_345) }
      it { expect(customer.referenceNumber).to eql(567_890) }
    end

    context 'with an id' do
      let(:customer) do
        Rackspace::Email::Api::Customer.new(
          420,
          {
            name: 'Name',
            accountNumber: 12_345,
            referenceNumber: 567_890
          }
        )
      end

      it { expect(customer.name).to eql('Name') }
      it { expect(customer.accountNumber).to eql(420) }
      it { expect(customer.referenceNumber).to eql(567_890) }
    end
  end
end
