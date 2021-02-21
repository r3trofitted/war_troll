Rails.application.routes.draw do
  get "/combats/:combat_id/round-:number", to: "rounds#show", as: :combat_round_canonical
  resources :rounds, only: [] do
    post "continue", on: :member 
  end
  resources :actions, only: [] do
    resources :missile_attack_resolutions, only: [:create], module: :actions
  end
end
