Rails.application.routes.draw do
  root 'billboards#index'
  resources :billboards do
    resources :songs
  end
  
  resources :artists do
    resources :albums
  end

  scope 'albums/:album_id', as: 'album' do
    resources :songs
  end
end
