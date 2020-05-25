# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :products, only: %i[index show]
      resources :orders, only: :show

      resource :cart, controller: :cart, only: :show do
        post :add_item
        delete 'remove_item/:line_item_id', to: 'cart#remove_item', as: :remove_item
      end
    end
  end
end
