Rails.application.routes.draw do
  resources :faturas
  resources :matriculas
  resources :alunos
  resources :instituicao_de_ensinos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
