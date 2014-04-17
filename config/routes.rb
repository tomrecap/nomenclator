Nomenclator::Application.routes.draw do

  resources :authors, only: [:index, :show]
  resources :chapters, only: [:index, :show]
  resource :definitions, only: :show
  resources :prose_books, only: [:index, :show]
  resources :prose_works, only: [:index, :show]
  resources :sections, only: [:index, :show]
  resource :static_pages, only: :show
  resources :texts do
    get "catullus", on: :collection # to: "texts#catullus"
    get "vergil", on: :collection # to: "texts#vergil"
    get "vf", on: :collection # to: "texts#vf"
  end

  get "iphone", to: "static_pages#iphone"
  root to: "texts#index"
end
