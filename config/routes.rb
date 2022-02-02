Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :slack, only: [:show, :index] do
        collection do
          get 'send_notification'
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
