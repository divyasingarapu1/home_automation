Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/outlets/turn_off', to: 'outlets#turn_off'
  get '/', to: 'outlets#index' 

  post '/outlets/run_command', to: 'outlets#run_command'
end
