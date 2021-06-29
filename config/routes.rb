Rails.application.routes.draw do
  root 'dojos#index'
  get 'dojos/new' => 'dojos#new'
  post 'dojos/post' => 'dojos#create'
  get 'dojos/:id' => 'dojos#show'
  get 'dojos/:id/edit' => 'dojos#edit'
  patch 'dojos/:id/patch' => 'dojos#update'
  get 'dojos/:id/delete' => 'dojos#destroy'

  get 'dojos/:dojo_id/students/new' => 'students#new'
  post 'dojos/:dojo_id/students/post' => 'students#create'
  get 'dojos/:dojo_id/students/:student_id' => 'students#show'
  get 'dojos/:dojo_id/students/:student_id/edit' => 'students#edit'
  patch 'dojos/:dojo_id/students/:student_id/patch' => 'students#update'
  delete 'dojos/:dojo_id/students/:student_id/delete' => 'students#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
