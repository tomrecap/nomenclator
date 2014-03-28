Nomenclator::Application.routes.draw do
  resource :static_pages, only: :show
  
  get "iphone", to: "static_pages#iphone"
  
  resource :definitions, only: :show
  
  root to: "static_pages#show"
  
end
