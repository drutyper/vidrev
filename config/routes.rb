Rails.application.routes.draw do
  resource :metacritic
  resource :youtube
  resource :vidrev

  root to: 'vidrev#index'
end
