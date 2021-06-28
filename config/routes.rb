Rails.application.routes.draw do
  root 'dojos#index'
  get 'dojos/new' => 'dojos#new'
  post 'dojos/post' => 'dojos#create'
  get 'dojos/:id' => 'dojos#show'
  get 'dojos/:id/edit' => 'dojos#edit'
  post 'dojos/:id/patch' => 'dojos#update'
  get 'dojos/:id/delete' => 'dojos#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
