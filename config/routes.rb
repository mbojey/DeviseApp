First_Website::Application.routes.draw do
devise_for :users
resource :questions
resource :search, :controller => :search
resource :topics
resource :practices

 
root to: 'static_pages#home'

match '/your_questions', to: 'questions#your_questions', via: 'get'
match '/flag_questions', to: 'questions#flag_questions', via: 'get'
match '/find_questions', to: 'search#find_questions', via: 'get'
match '/flag', to: 'questions#flag', via: 'get'
match '/unflag', to: 'questions#unflag', via: 'get'
match '/submitted', to: 'questions#submit', via: 'get'
match '/hidden', to: 'questions#hide', via: 'get'
match '/correct', to: 'questions#correct', via: 'get'
match '/incorrect', to: 'questions#incorrect', via: 'get'
match '/changes', to: 'questions#changes', via: 'get'
match '/comment', to: 'questions#comment', via: 'patch'
match '/search', to: 'search#create', via: 'get'
match '/remove', to: 'topics#remove', via: 'get'
match '/study/', to: 'practices#use', via: 'get'
match '/answer', to: 'practices#submit', via: 'post'
match '/view', to: 'questions#view', via:'get'
match '/mark', to: 'questions#mark', via:'get'

mount Ckeditor::Engine => '/ckeditor'


end
