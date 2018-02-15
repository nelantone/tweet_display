require 'rails_helper'

RSpec.describe TweetDisplay, type: :model do
  describe 'given #twitter well configured account with permissions' do
    it '#twitter has true credentials'do
      expect(TweetDisplay.twitter.credentials?).to eq(true)
    end
  end
end
