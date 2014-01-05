First_Website::Application.routes.draw do
devise_for :users
resource :questions
resource :search, :controller => :search

 
root to: 'static_pages#home'

match '/your_questions', to: 'questions#your_questions', via: 'get'
match '/find_questions', to: 'search#find_questions', via: 'get'
match '/submitted', to: 'questions#submit', via: 'get'
match '/hidden', to: 'questions#hide', via: 'get'
match '/correct', to: 'questions#correct', via: 'get'
match '/incorrect', to: 'questions#incorrect', via: 'get'
match '/changes', to: 'questions#changes', via: 'get'
match '/comment', to: 'questions#comment', via: 'patch'
match '/search', to: 'search#create', via: 'get'


end
