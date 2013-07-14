class Event < ActiveRecord::Base
  attr_accessible :description, :location, :name, :start_time, :time, :website
end
