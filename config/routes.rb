Rails.application.routes.draw do
  devise_for :users
  root 'users#top'
  resources :tasks
  post '/task/done/:id', to: 'tasks#done', as: 'task_done'
end
