require_dependency "subscriber/application_controller"
require 'subscriber/constraints/subdomain_required'
module Subscriber
  class Account::SessionsController < Subscriber::ApplicationController

    def new
      @user = User.new
    end

    def create
      if env["warden"].authenticate(:scope => :user)
        flash[:success] = "You are now signed in."
        redirect_to root_path
      else
        @user = User.new
        flash[:error] = "IInvalid email or password."
        render :action => "new"
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

  end
end
