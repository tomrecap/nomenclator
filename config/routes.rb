Nomenclator::Application.routes.draw do

  resources :texts do
    get "catullus", on: :collection # to: "texts#catullus"
    get "vergil", on: :collection # to: "texts#vergil"
    get "vf", on: :collection # to: "texts#vf"
  end
  
  resource :static_pages, only: :show
  
  get "iphone", to: "static_pages#iphone"
  
  resource :definitions, only: :show
  
  root to: "texts#index"
  
end
