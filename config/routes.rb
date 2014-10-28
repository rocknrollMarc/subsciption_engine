Subscriber::Engine.routes.draw do
  
  constraints(Subscriber::Constraints::SubdomainRequired) do
    scope :module => "account" do
      root :to => "dashboard#index", :as => :account_root
    end
  end

  root "dashboard#index"

  get "/sign_up", :to => "accounts#new", :as => :sign_up
  post "/accounts", :to => "accounts#create", :as => :accounts
end
