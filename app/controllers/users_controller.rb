class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def follow
    Relationship.create(user_id: current_user.id, following_id: @user.id)
    redirect_to user_path(@user.id)
  end

  def unfollow
  end

end