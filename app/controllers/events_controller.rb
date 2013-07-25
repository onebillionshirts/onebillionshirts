class EventsController < ApplicationController

   def create
     @event = Event.create(params[:event])
     flash[:notice] = 'Event was successfully created.'
     redirect_to calendar_path
   end
end
