Rails.application.routes.draw do
  root 'users#top'

  # users
  devise_for :users, controllers: { registrations: 'registrations' }

  # tasks
  resources :tasks, except: [:show, :new]
  post '/task/done/:id', to: 'tasks#done', as: 'task_done'
end
