  Rails.application.routes.draw do
  devise_for :users
  resource   :metacritic
  resource   :youtube
  resource   :vidrev

  root to: 'vidrev#index'
end
