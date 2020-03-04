class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    user = User.find(params[:relationship][:following_id])
    following = current_user.follow(user)
    user.create_notification_follow!(current_user)
    
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
    redirect_to user
  end

  def destroy
    user = User.find(params[:relationship][:following_id])
    following = current_user.unfollow(user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    end
    redirect_to user
  end

  private
  def set_user
    user = User.find(params[:relationship][:following_id])
  end

end