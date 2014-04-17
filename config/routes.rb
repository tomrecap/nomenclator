Nomenclator::Application.routes.draw do

  resources :authors, only: [:index, :show]
  resources :chapters, only: :show
  resource :definitions, only: :show
  resources :prose_books, only: :show
  resources :prose_works, only: :show
  resources :sections, only: :show
  resource :static_pages, only: :show
  resources :texts do
    get "catullus", on: :collection # to: "texts#catullus"
    get "vergil", on: :collection # to: "texts#vergil"
    get "vf", on: :collection # to: "texts#vf"
  end

  get "iphone", to: "static_pages#iphone"
  root to: "texts#index"
end
