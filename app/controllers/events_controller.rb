class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :join, :unjoin, :destroy]
  
  def index
    @events = Event.all.order(date: :asc).page(params[:page]).per(10)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @event_user = EventUser.where(event_id: @event.id, user_id: current_user.id)[0]
  end
  
  def edit
  end
  
  def update
    @event.update(event_params)
    redirect_to event_path
  end
  
  def destroy
    @event.destroy
    redirect_to root_path
  end
  
  def join
    EventUser.create(user_id: current_user.id, event_id: @event.id)
    redirect_to event_path
  end
  
  def unjoin
    event_user = EventUser.where(user_id: current_user.id, event_id: params[:id])[0]
    event_user.destroy
    redirect_to event_path(params[:id])
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :place, :date, :time, :image).merge(owner: current_user.id)
  end

end
