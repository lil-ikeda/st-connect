class RoomsController < ApplicationController

  def new
    @room = Room.new
    # @room.users << current_user
  end

  def create
    @room= Room.new
    if @room.save
      Room.create(user1_id: current_user.id, room2_id: @room.id)
      redirect_to root_path, notice: 'マッチングが成立しました！'
    else
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
  end

end
