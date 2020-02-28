class RoomsController < ApplicationController

  def new
    @room = Room.new
    # @room.users << current_user
  end

  def create
    @room= Room.new
    if @room.save
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
      redirect_to root_path, notice: 'マッチングが成立しました！'
    else
      render :new
    end
  end

  def show
    # @user = User.find(params[:id])
    @room = Room.find(params[:id])
    @self = @room.users.find_by(id: current_user.id)
    @other_user = @room.users.where.not(id: current_user.id)[0]
  end

end
