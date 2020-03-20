class NotificationsController < ApplicationController
  def index
    if user_signed_in?
      @notifications = current_user.passive_notifications
      @notifications.where(checked: false).each do |notification|
        notification.update_attributes(checked: true)
      end
    else
      redirect_to root_path, alert: "フォロー通知の閲覧にはログインが必要です"
    end
  end
end
