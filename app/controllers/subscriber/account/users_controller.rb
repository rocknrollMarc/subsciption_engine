require_dependency "subscriber/application_controller"

module Subscriber
  class Account::UsersController < ApplicationController

    def new
      @user = Subscriber::User.new
    end
  end
end
