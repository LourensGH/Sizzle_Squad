class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @sizzler = Sizzler.find(params[:id])
    @user = current_user
    @bookings = Booking.where(user_id: @user)
  end
end
