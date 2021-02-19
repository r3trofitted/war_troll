Rails.application.routes.draw do
  get "/combats/:combat_id/round-:number", to: "rounds#show", as: :combat_round_canonical
end
