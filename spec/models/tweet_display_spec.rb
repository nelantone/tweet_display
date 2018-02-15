require 'rails_helper'

RSpec.describe TweetDisplay, type: :model do
  describe 'given #twitter well configured account with permissions' do
    it '#twitter has true credentials' do
      expect(TweetDisplay.twitter.credentials?).to eq(true)
    end
  end

  describe 'given #twitter well configured account without permissions' do
    let(:nil_token) { nil }
    let(:false_token) { '123456' }

    it '#twitter miss some credential/s' do
      ENV['ACCESS_TOKEN'] = nil_token
      expect { TweetDisplay.twitter.verify_credentials }.to raise_error(Twitter::Error::Forbidden)
    end

    it '#twitter has wrong/unauthorized credentials' do
      ENV['ACCESS_TOKEN'] = false_token
      expect { TweetDisplay.twitter.verify_credentials }.to raise_error(Twitter::Error::Unauthorized)
    end
  end
end
