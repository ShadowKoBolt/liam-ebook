Rails.application.routes.draw do
  root to: 'application#index'

  get 'download' => 'application#index'
  post 'download' => 'application#download'

  get 'admin' => 'admin#signups'
end
