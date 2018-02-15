class TweetDisplaysController < ApplicationController
  def index
    if params[:q]
      search_term = params[:q]
      @results = TweetDisplay.search(search_term)
    else
      'sorry not matches found, try again!'
    end
  end

  def send_q
    @results = TweetDisplay.twitter.search(params[:q])
  end
end
