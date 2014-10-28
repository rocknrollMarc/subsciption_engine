require_dependency "subscriber/application_controller"

module Subscriber
  class Account::DashboardController < Subscriber::ApplicationController
    before_filter :authenticate_user!
  end
end
