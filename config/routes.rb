Rails.application.routes.draw do
  post 'reset', to: 'games#reset', as: :reset
  get 'new', to: 'games#new', as: :new
  post 'score', to: 'games#score', as: :score
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
