require 'rails_helper'

RSpec.describe TweetDisplay, type: :model do
  describe 'has #twitter well configured account with permissions' do
    it 'has true credentials' do
      expect(described_class.twitter.credentials?).to eq(true)
    end

    it 'has a succesfull search request' do
      expect(described_class.twitter.search('#ruby #rails', lang: "en").first.text).to include('#ruby', '#rails')
    end
  end

  describe 'has #twitter account with errors' do
    let(:nil_token) { nil }
    let(:false_token) { '123456' }

    it 'miss some credential/s' do
      ENV['ACCESS_TOKEN'] = nil_token
      expect { described_class.twitter.verify_credentials }.to raise_error(Twitter::Error::Forbidden)
    end

    it 'has wrong/unauthorized credentials' do
      ENV['ACCESS_TOKEN'] = false_token
      expect { described_class.twitter.verify_credentials }.to raise_error(Twitter::Error::Unauthorized)
    end
  end
end
