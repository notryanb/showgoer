class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    p "***********************************************"
    p "These are the comment_params: #{comment_params}"
    if request.xhr?
      @new_comment = comment.new(content: , video_id: , user_id: )
      render json: @new_comment.content, layout: false
      flash[:notice] = "Thank You for Commenting!"
    else
      @concertid = params[:comment][:theconcert_id]
      @new_comment = Comment.new(comment_params)

    end
    # if @new_comment.save!
    #   flash[:notice] = "Thank You for Commenting!"
    #   redirect_to concert_path(@concertid)
    # else
    #   flash.now[:notice] = 'There was an error'
    #   render :new
    # end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    video = Video.find_by(id: comment.video_id)
    concert = video.concert_id
    if comment.update(comment_params)
     redirect_to concert_path(concert)
   else
    [404, "The Page cannot be retrived"]
  end
end

def destroy
  comment = Comment.find(params[:id])
  video = Video.find_by(id: comment.video_id)
  concert = video.concert_id
  comment.destroy
  respond_to do |format|
    format.html { redirect_to concert_path(concert), notice: 'The Comment was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
def comment_params
  params.require(:comment).permit(:content, :video_id, :user_id)
end
end