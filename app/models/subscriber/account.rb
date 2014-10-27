module Subscriber
  class Account < ActiveRecord::Base
    belongs_to :owner, :class_name => "Subscriber::User"
    accepts_nested_attributes_for :owner

    EXCLUDED_SUBDOMAINS = %w(admin)
    validates :subdomain, :presence => true, :uniqueness => true
    validates_exclution_of :subdomain, :in => EXCLUDED_SUBDOMAINS,
      :message => "is not allowed. Please choose another subdomain."
  end
end
