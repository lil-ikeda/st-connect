class RoomsController < ApplicationController

  def create
    @room= Room.new
    if @room.save
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
      redirect_to root_path, notice: 'マッチングが成立しました！'
    else
      render :new
    end
  end

  def update
  end

  def show
    @room = Room.find(params[:id])
    @self = @room.users.find_by(id: current_user.id)
    @other_user = @room.users.where.not(id: current_user.id)[0]
    @messages = @room.messages
  end

  

end
