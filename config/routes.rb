Nomenclator::Application.routes.draw do
  resource :static_pages, only: :show
  resource :definitions, only: :show
  
  root to: "static_pages#show"
  
end
