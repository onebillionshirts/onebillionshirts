class Admins::SiteEventsController < ApplicationController

  layout "admin"

  def index
    @events = Event.unscoped.where(is_approved: false)
  end

  def approve
    @event = Event.unscoped.find(params[:id])
    @event.update_attribute(:is_approved, true)
    flash[:notice] = "Approved"
    redirect_to admins_site_events_path
  end

  def subscribers
    @sub = EventSubscriber.all
  end

end
