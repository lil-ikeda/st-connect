class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_to event_path(params[:event_id]), notice: "コメントを投稿しました"
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to event_path(params[:event_id]), notice: "コメントを削除しました"
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
