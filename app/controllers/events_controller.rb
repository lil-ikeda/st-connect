class EventsController < ApplicationController
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


  private
  def event_params
    params.require(:event).permit(:name, :place, :date, :time, :image)
  end
end
