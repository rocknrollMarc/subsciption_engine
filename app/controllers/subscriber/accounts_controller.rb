require_dependency "subscriber/application_controller"

module Subscriber
  class AccountsController < ApplicationController

    def new
      @account = Subscriber::Account.new
    end
  end
end
