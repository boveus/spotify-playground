Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#show"

  post 'hue/flash_lights', to: 'hue#flash_lights'

  post 'spotify/refresh_song', to: 'users#refresh_song'

  get '/auth/spotify/callback', to: 'users#spotify'
end
