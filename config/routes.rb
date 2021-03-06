Rails.application.routes.draw do
  get "/combats/:combat_id/round-:number", to: "rounds#show", as: :combat_round_canonical
  resources :rounds, only: [] do
    post "continue", on: :member 
  end
end
