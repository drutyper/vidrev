Rails.application.routes.draw do
  resource :metacritic
  resource :youtube

  get "vidrev/index"

  root to: 'vidrev#index'
end
