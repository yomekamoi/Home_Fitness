Rails.application.routes.draw do

  devise_for :users,
  	controllers: { registrations: 'registrations' }

	root 'homes#top'
	get 'homes/about' => 'homes#about'
	resources :users,only: [:show,:edit,:update,:index]

	resources :posts, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)

     resources :likes, only: %i(create destroy)
     resources :comments, only: %i(create destroy)
  end
end
