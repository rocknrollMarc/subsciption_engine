require_dependency "subscriber/application_controller"

module Subscriber
  class AccountsController < ApplicationController

    def new
      @account = Subscriber::Account.new
    end

    def create
      account = 
        Subscriber::Account.create(account_params)
      flash[:success] = "Your account has been successfully created."
      redirect_to subscriber.root_url
    end

  private

  def account_params
    params.require(:account).permit(:name)
  end
  end

end
