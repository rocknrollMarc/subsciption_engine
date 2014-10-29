class Thing < ActiveRecord::Base
  def self.scoped_to(account)
    where(:account_id => account_id)
  end
end
