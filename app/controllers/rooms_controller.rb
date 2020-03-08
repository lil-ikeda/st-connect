class RoomsController < ApplicationController
  def create
    @room = Room.new
    if @room.save
      RoomUser.create(user_id: current_user.id, room_id: @room.id)
      redirect_to root_path, notice: 'マッチングが成立しました！'
    else
      render :new
    end
  end

  def update; end

  def show
    if user_signed_in?
      @room = Room.find(params[:id])
      redirect_to root_path, alert: "あなたの所属していないチャットルームの閲覧はできません" unless @room.users.include?(current_user)
      @self = @room.users.find_by(id: current_user.id)
      @other_user = @room.users.where.not(id: current_user.id)[0]
      @messages = @room.messages
    else
      redirect_to new_user_session_path, alert: "チャット機能の利用にはログインが必要です"
    end
  end
end
