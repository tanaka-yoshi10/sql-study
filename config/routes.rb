Rails.application.routes.draw do
  resources :questions, only: :index do
    collection do
      get :q1
      get :q2
      get :q3
      get :q4
    end
  end
  root to: 'questions#index'
end
