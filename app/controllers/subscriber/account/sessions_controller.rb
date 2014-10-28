require_dependency "subscriber/application_controller"
require 'subscriber/constraints/subdomain_required'
module Subscriber
  class Account::SessionsController < Subscriber::ApplicationController

    def new
      @user = User.new
    end

    def create
      if env["warden"].authenticate(:scope => :user)
        flash[:notice] = "You are now signed in."
        redirect_to root_path
      end
    end

  end
end
