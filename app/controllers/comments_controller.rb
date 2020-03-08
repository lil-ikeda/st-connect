class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to event_path(params[:event_id]), notice: "コメントを投稿しました"
    else
      flash[:alert] = "文字数を確認してください"
      redirect_to event_path(params[:event_id])
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to event_path(params[:event_id]), notice: "コメントを削除しました"
    else
      flash[:alert] = "コメントの削除に失敗しました"
      redirect_to event_path(params[:event_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
