# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'home#get', as: 'root_path'
  get '/optimize', to: 'home#optimize', as: 'optimize_path'
end
