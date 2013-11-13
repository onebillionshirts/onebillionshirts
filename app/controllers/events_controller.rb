class EventsController < ApplicationController

   def create
     @event = Event.create(params[:event])
     flash[:notice] = 'Event was successfully created.'
     redirect_to calendar_path
   end


  def subscribers
    @sub = EventSubscriber.create(params[:event_subscriber])
    redirect_to thanks_events_path
  end

  def thanks
  end

end
