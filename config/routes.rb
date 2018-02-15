Rails.application.routes.draw do
  root 'tweet_displays#index'
  post 'tweet_displays/send_q'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
