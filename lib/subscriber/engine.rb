module Subscriber
  require 'warden'
  require 'dynamic_form'

  class Engine < ::Rails::Engine
    isolate_namespace Subscriber

    config.to_prepare do
      root = Subscriber::Engine.root
      extenders_path = root + "app/extenders/**/*.rb"
      Dir.glob(extenders_path) do |file|
        Rails.configuration.cache_classes ? require(file) : load(file)
      end
    end


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
      g.test_framework :rspec, :view_spec => false,
        :controller_spec => false,
        :model_spec => false,
        :helper_spec => false
    end

  end
end
