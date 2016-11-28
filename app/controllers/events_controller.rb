class EventsController < ApplicationController
  def index
    @events  =  Event.all
  end

  def new
    @event =  Event.new
  end
  
  def edit
    @event = Event.find(params[:id])
  end
  
  def update
    @event = current_user.events.find(params[:id])
    if @event.update(event_params)
      redirect_to events_path
    end
  end
  
  def create
    # raise 'error'
    @event = current_user.events.build(event_params)
    
    if @event.save
      redirect_to events_index_path
    else
      redirect_to root_path
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  def destroy
    
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to profile_path(:id => current_user.id,:query =>'events_created')
    end
    
  end
  
  def participate
    user = current_user
    event = Event.find(params[:event_id])
    participant = event.participants.build(part_params)
    if participant.save
      @decider = true
    else
      @decider = false
    end
  end
  private
  
  def event_params  
     params.require(:event).permit(:title,:description,:image,:min_age,:max_age,:address,:city,:skills => [])
  end
  
  def part_params
    params.require(:participant).permit(:event_id,:uid)
  end
end
