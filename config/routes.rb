Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "message#index" 

  get "new_message", to: "message#edit"

  post "save_message", to: "message#save"
end
