Rails.application.routes.draw do
  get 'static_pages_controller/home'

  get 'static_pages_controller/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  Rails.application.routes.draw do
  get 'static_pages_controller/home'

  get 'static_pages_controller/help'

  	root 'application#hello'
  end
  
end
