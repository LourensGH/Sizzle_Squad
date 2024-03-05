class BookingsController < ApplicationController

  def new
    @sizzler = Sizzler.find(params[:sizzler_id])
    @booking = Booking.new
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to sizzler_booking_path(@booking, @booking.sizzler), notice: "Booking successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :sizzler_id, :user_id)
  end
end
