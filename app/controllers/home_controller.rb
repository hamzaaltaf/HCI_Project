class HomeController < ApplicationController
  def index
  end
  def profile
    if params[:query] == 'settings'
    
    elsif params[:query] == 'events_created'
      @events = current_user.events
    elsif params[:query] == 'events_attended'
      @events = Participant.where(uid: current_user.id)
      @events.inspect
    end
    
  end
end
