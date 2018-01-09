class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params.merge(user_id: current_user.id))

    if @comment.save
      redirect_to post_path(@post)
    end

  end

  def update
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
