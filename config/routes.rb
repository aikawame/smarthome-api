Rails.application.routes.draw do
  resources :skills, only: %i() do
    collection do
      post :pc
    end
  end
end
