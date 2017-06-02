Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/students/:id' => 'students#show', :as => :student
      get '/teachers' => 'teachers#index', :as => :teachers
      delete '/teachers/:id' => 'teachers#destory', :as => :cancel_teacher
      post '/courses/:course_id/:student_id' => "students#select_course", :as => :select_course
    end
  end
end
