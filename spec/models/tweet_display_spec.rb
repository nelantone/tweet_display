require 'rails_helper'

RSpec.describe TweetDisplay, type: :model do
  describe 'has #twitter well configured account with permissions' do
    it 'has true credentials' do
      expect(TweetDisplay.twitter.credentials?).to eq(true)
    end
  end

  describe 'has #twitter account with errors' do
    let(:nil_token) { nil }
    let(:false_token) { '123456' }

    it 'miss some credential/s' do
      ENV['ACCESS_TOKEN'] = nil_token
      expect { TweetDisplay.twitter.verify_credentials }.to raise_error(Twitter::Error::Forbidden)
    end

    it 'has wrong/unauthorized credentials' do
      ENV['ACCESS_TOKEN'] = false_token
      expect { TweetDisplay.twitter.verify_credentials }.to raise_error(Twitter::Error::Unauthorized)
    end
  end
end
