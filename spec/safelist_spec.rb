# frozen_string_literal: true

require 'spec_helper'

describe Rackspace::Email::Api::Safelist do
  before(:each) do
    Rackspace::Email::Api.configure do |config|
      config.user_key = 'user_key'
      config.api_key = 'api_key'
    end
  end

  let(:endpoint) { Rackspace::Email::Api::Safelist.new(customer_id: 12_345, domain: 'domain.com') }

  describe 'index' do
    it 'should work' do
      url = endpoint.url_for(:index).to_s
      expect(url).to eql('https://api.emailsrvr.com/v1/customers/12345/domains/domain.com/spam/safelist')
    end
  end

  describe 'add' do
    it 'should work' do
      url = 'https://api.emailsrvr.com/v1/customers/12345/domains/domain.com/spam/safelist/foo@bar.com'
      expect(endpoint).to receive(:call_api_url).with(url, :post)
      endpoint.add('foo@bar.com')
    end
  end

  describe 'remove' do
    it 'should work' do
      url = 'https://api.emailsrvr.com/v1/customers/12345/domains/domain.com/spam/safelist/foo@bar.com'
      expect(endpoint).to receive(:delete).with(url)
      endpoint.remove('foo@bar.com')
    end
  end
end
