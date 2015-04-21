class CommentsController < ApplicationController


  def new
    @comment = Comment.new
  end

  def create
  	@video = Video.find_by(:id => params[:id])
    new_comment = Comment.new(comment_params)
    if new_comment.save!
      flash[:notice] = "Thank You for Commenting!"
      redirect_to "/concerts/#{@video.concert_id}"
    else
      flash.now[:notice] = 'There was an error'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :video_id)
  end
end