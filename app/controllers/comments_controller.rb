class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to event_path(params[:event_id]), notice: "コメントを投稿しました"
    else
      flash[:alert] = "空欄のコメントは入力できません"
      redirect_to event_path(params[:event_id])
    end
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
