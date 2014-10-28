require_dependency "subscriber/application_controller"

module Subscriber
  class Account::SessionsController < ApplicationController

    def new
      @user = User.new
    end

  end
end
