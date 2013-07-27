class Event < ActiveRecord::Base
  attr_accessible :description, :location, :name, :start_time, :time, :website, :is_approved


  default_scope where(is_approved: true)


end
