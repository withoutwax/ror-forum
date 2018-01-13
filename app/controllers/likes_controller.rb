class LikesController < ApplicationController
  def create
    current_user.like!(@likeable)

    puts 'Like saved!'
    redirect_to root_path
  end



  private
    def like_params
      params.require(:likes).permit(:user_id, :post_id)
    end

end
