module Subscriber
  class Engine < ::Rails::Engine
    isolate_namespace Subscriber

    config.generators do |g|
      g.test_framework :rspec, :view_spec => false
    end

  end
end
