class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @events = Event.where(owner: @user.id)
    @following_users = @user.followings
    passive_relationships = Relationship.where(following_id: @user.id)
    @followed_users = User.where(id: passive_relationships.select(:user_id))
    @matchers = @user.matchers
    @room = (current_user.rooms & @user.rooms)[0] if user_signed_in?
  end
end
