require 'rails_helper'

describe Subscriber::AccountsController do
  context "creates the accounts schema" do
    let!(:account) { Subscriber::Account.new }

    before do
      expect(Subscriber::Account).to receive(:create_with_owner).and_return(account)
      allow(account).to receive(:valid?).and_return(true)
      allow(controller).to receive(:force_authentication).and_return(true)
    end
    specify do
      expect(account).to receive(:create_schema)
      post :create, :account => { :name => "First Account"}
    end
  end
end
