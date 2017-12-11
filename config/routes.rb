Rails.application.routes.draw do
  get 'welcome/index'
  get 'bitcoin/index'
  get 'ethereum/index'

  put 'preferences/update'

  root 'welcome#index'

  resources :prefs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
