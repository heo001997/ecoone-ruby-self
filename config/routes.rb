Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :users, only: [:index], params: :user_id do
    #collection do
    #  get 'me' => 'me#index'
    #end
  #end

  resources :users, only: [:index, :new], param: :user_id
  #resources :users, only: [:index], param: :user_id
  #get 'users/:id' => 'users#index'       Equal to above, normal way on tutorial
end