Subscriber::Engine.routes.draw do
  
  constraints(Subscriber::Constraints::SubdomainRequired) do
  end

  root "dashboard#index"

  get "/sign_up", :to => "accounts#new", :as => :sign_up
  post "/accounts", :to => "accounts#create", :as => :accounts
end
