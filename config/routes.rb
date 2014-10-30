Rails.application.routes.draw do

  resources :profiles, only: [:edit, :update, :destroy, :create]

  get '/admin' => 'admin#index'
  get '/dashboard' => 'dashboard#index'
  get '/help' => 'help#index'

  devise_for :users, controllers: {confirmations: 'local_devise/confirmations',
                                   registrations: 'local_devise/registrations',
                                   unlocks: 'local_devise/unlocks',
                                   passwords: 'local_devise/passwords'}

  root 'dashboard#index'

  get 'devise_usage_report', to: 'devise_usage_log#devise_usage_report'
  get 'close_devise_usage_report', to: 'devise_usage_log#close_devise_usage_report'

end
