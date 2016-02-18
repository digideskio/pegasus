Rails.application.routes.draw do
  devise_for :accounts
  use_doorkeeper

  root 'index#home'
end
