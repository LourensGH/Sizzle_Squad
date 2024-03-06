class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @sizzler = Sizzler.find(params[:id])
    @user = current_user
    @bookings = Booking.where(sizzler_id: @sizzler)
  end
end
