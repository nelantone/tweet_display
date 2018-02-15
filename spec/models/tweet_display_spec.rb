require 'rails_helper'

RSpec.describe TweetDisplay, type: :model do
  describe 'given #twitter well configured account with permissions' do
    it 'has #twitter' do
      expect(TweetDisplay.twitter).to eq('')
    end

  end
end
