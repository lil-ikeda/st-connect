class MessagesController < ApplicationController
  def create
    message = Message.create(user_id: params[:user_id], room_id: params[:room_id], content: params[:content])
    if message.save
      redirect_to room_path(params[:room_id])
    else
      flash[:alert] = "文字数を確認してください。"
      redirect_to room_path(params[:room_id])
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :room_id)
  end
end
