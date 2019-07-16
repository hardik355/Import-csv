Rails.application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  
  resources :employees do
    collection { post :import }
  end
   root to: 'employees#index'

end
