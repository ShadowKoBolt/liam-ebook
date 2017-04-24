Rails.application.routes.draw do

  constraints subdomain: %w{guide ebook} do
    root to: 'application#index'

    get 'download' => 'application#index'
    post 'download' => 'application#download'
  end

  constraints subdomain: %w{interest} do
    root to: 'interests#new'
    post '/' => 'interests#create'
  end

  get 'admin' => 'admin#signups'
end
