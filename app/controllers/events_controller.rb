class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :join, :destroy]
  
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

  private
  def event_params
    params.require(:event).permit(:name, :place, :date, :time, :image)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
