class Vote < ActiveRecord::Base
  attr_accessible :ip

  belongs_to :contest_entry
end
