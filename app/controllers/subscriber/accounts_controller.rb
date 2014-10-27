require_dependency "subscriber/application_controller"

module Subscriber
  class AccountsController < ApplicationController

    def new
      @account = Subscriber::Account.new
    end

    def create
      account = Subscriber::Account.create(account_params)
      flash[:success] = "Your account has been successfully created."
      redirect_to subscriber.root.url
    end
  end
end
