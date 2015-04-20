class AttendsController < ApplicationController

  def create
    @attend = Attend.create(user_id: current_user.id, concert_id: params[:concert_id])

    concert = Concert.find_by(id: params[:concert_id])
    concert_attendance = concert.attends.count

    if request.xhr?
      render json:concert_attendance, layout: false
    else
      redirect_to :back
    end
  end


end