module Subscriber
  class Account < ActiveRecord::Base
    has_many :members, :class_name => "Subscriber::Member"
    has_many :users, :through => :members
    belongs_to :owner, :class_name => "Subscriber::User"
    accepts_nested_attributes_for :owner

    before_validation do
      self.subdomain = subdomain.to_s.downcase
    end

    validates :subdomain, :presence => true, :uniqueness => true

    validates_format_of :subdomain, :with => /\A[\w\-]+\Z/i,
      :message => "is not allowed. Please choose another subdomain\."

    EXCLUDED_SUBDOMAINS = %w(admin)
    validates_exclusion_of :subdomain, :in => EXCLUDED_SUBDOMAINS,
        :message => "is not allowed. Please choose another subdomain."

    def self.create_with_owner(params={})
      account = new(params)
      if account.save
        account.users << account.owner
      end
      account
      end

    def create_schema
      Apartment::Database.create(subdomain)
    end

  end
end
