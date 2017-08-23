Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#welcome'

  get 'callback', to: 'home#callback'
  get 'contacts_list', to: 'home#contacts_list'

end
