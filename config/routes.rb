Rails.application.routes.draw do
  get 'cheese-ball' => 'cheese_ball#index'
  post 'cheese-ball' => 'cheese_ball#index'
end
