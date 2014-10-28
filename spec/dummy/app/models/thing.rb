class Thing < ActiveRecord::Base
  belongs_to :account, :class_name => "Subscriber::Account"
end
