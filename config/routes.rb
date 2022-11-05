# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do     
 resources :items do                # scaffolding RESTful actions
    get :upvote, on: :member        # new action; get - method,  
   # :upvote - method name, on: :member - получаем доступ к нему после id в адресной строке   
    get :expensive, on: :collection
 end
end
