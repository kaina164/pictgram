class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @topic = Topic.find(params[:topic_id])
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    
    if @comment.save
      redirect_to topics_path, success: "コメントの投稿に成功しました"
    else
      @topic = Topic.find(params[:comment][:topic_id])
      flash.now[:danger] = "コメントの投稿に失敗しました"
      render :new
    end
  end
  
  
  private
    def comment_params
      params.require(:comment).permit(:text, :topic_id)
    end
end
