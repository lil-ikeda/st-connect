class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @room = (current_user.rooms & @user.rooms)[0]
    @events = Event.where(owner: @user.id)
    @following_users = @user.followings
    passive_relationships = Relationship.where(following_id: @user.id)
    @followed_users = User.where(id: passive_relationships.select(:user_id))
    @matchers = @user.matchers
  end

end