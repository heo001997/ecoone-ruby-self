Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #resources :users, only: [:index], params: :user_id do
    #collection do
    #  get 'me' => 'me#index'
    #end
  #end

  resources :users, only: [:index, :create], param: :user_id
  resources :surveys, only: [:index, :show, :create], param: :survey_id
end