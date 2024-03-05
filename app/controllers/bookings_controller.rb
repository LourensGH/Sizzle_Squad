class BookingsController < ApplicationController

  def new
    @sizzler = Sizzler.find(params[:sizzler_id])
    @booking = Booking.new
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to sizzler_booking_path(@booking, @booking.sizzler, @booking.accepted), notice: "Booking successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @bookings = Booking.all
  end

  def destroy
    @sizzler = Sizzler.find(params[:sizzler_id])
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :sizzler_id, :user_id, :accepted)
  end
end
