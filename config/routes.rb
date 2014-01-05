First_Website::Application.routes.draw do
devise_for :users
resource :questions

 
root to: 'static_pages#home'

match '/your_questions', to: 'questions#your_questions', via: 'get'

end
