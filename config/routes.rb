Rails.application.routes.draw do
  resolve("Round") { |round, options| combat_round_url(round.combat, round.number, options) }
  get "/combats/:combat_id/round-:number", to: "rounds#show", as: :combat_round
  
  %w(
    SpellPreparation
    SpellCasting
    MissileAttack
    Movement
    Maneuvre
    MeleeAttack
  ).each do |action_type|
    resolve(action_type) { |at, options| [at.participation, :actions, options.merge(type: action_type)] }
  end

  resources :combats, only: :create, shallow: true do
    resources :rounds, only: :show, shallow: true do
      member do
        post "continue"
        post "next"
      end
      resources :participations, only: %w[new create], shallow: true do
        resources :actions, only: %i(create destroy)
      end
    end
  end

  get "home", to: "home#show"
  
  root "home#show"
end
