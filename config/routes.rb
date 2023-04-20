Rails.application.routes.draw do
  get 'lists' => 'lists#index'
  post 'lists' => 'lists#create'
  get 'lists/show'
  get  'lists/:id/edit' => 'lists#edit', as: 'edit_list'
  get 'lists/:id' => 'lists#show', as: 'list'
  patch 'lists/:id' => 'lists#update', as: 'update_list'
  delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/top' => 'homes#top'
end
