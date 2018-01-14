class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_likeable

  def create
    current_user.like!(@likeable)

    puts 'Like saved!'
  end

  def destroy
    current_user.unlike!(@likeable)

    puts 'Like saved!'
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_likeable
      raise NotImplementedError, "This #{self.class} cannot respond to 'set_likeable'"
    end

    def like_params
      params.require(:likes).permit(:user_id, :post_id)
    end

end
