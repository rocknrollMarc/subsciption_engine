module Subscriber
  require 'warden'
  require 'dynamic_form'
  class Engine < ::Rails::Engine
    isolate_namespace Subscriber

    initializer "subscriber.middleware.warden" do
      Rails.application.config.middleware.use Warden::Manager do |manager|

        # use :password as default warden strategy
        manager.default_strategies :password

        manager.serialize_into_session do |user|
          user.id
        end

        manager.serialize_from_session do |id|
          Subscriber::User.find(id)
        end
      end
    end

    config.generators do |g|
      g.test_framework :rspec, :view_spec => false
    end

  end
end
