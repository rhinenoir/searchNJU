Rails.application.routes.draw do
  get '/'
  
  get 'core/index'

  get 'core/search'

  post 'core/search_ajax'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
