class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @room = (current_user.rooms & @user.rooms)[0]
  end

end