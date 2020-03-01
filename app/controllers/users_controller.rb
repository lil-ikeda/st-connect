class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @room = (current_user.rooms & @user.rooms)[0]
    @events = Event.where(owner: @user.id)
    @following_users = current_user.followings
    passive_relationships = Relationship.where(following_id: current_user.id)
    @followed_users = User.where(id: passive_relationships.select(:user_id))
    @matchers = current_user.matchers
  end

end