Rails.application.routes.draw do
  resolve("Round") { |round, options| combat_round_url(round.combat, round.number, options) }
  get "/combats/:combat_id/round-:number", to: "rounds#show", as: :combat_round

  resources :combats, only: :create, shallow: true do
    resources :rounds, only: :show, shallow: true do
      member do
        post "continue"
        post "next"
      end
      resources :participations, only: %w[new create]
    end
  end
  
  get "home", to: "home#show"
  
  root "home#show"
end
