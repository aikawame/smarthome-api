Rails.application.routes.draw do
  resources :pcs, only: %i() do
    member do
      post :poweron
      post :poweroff
      post :input_pc
      post :input_primevideo
      post :input_netflix
    end
  end

  resources :tvs, only: %i() do
    member do
      post :setinput
    end
  end
end
