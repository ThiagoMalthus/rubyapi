Rails.application.routes.draw do
  resources :faturas, only: [:show, :index]
  resources :matriculas, only: [:show, :index, :create]
  resources :alunos, only: [:show, :index, :create]
  resources :instituicao_de_ensinos, only: [:show, :index, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
