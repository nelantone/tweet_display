class TweetDisplay < ApplicationRecord
  def self.twitter
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_SECRET']
    end
  end

  def search(search_term)
    where("name ilike ?", "%#{search_term}%")
  end


  def self.order_last_before(params)
    find(params[:id]).comments.order("created_at DESC")
  end
end
