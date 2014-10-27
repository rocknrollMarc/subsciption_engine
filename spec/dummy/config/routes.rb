Rails.application.routes.draw do

  mount Subscriber::Engine :at => "/subscriber"
end
