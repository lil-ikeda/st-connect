class CommentsController < ApplicationController


  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to event_path(params[:event_id])  }
      format.json
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
