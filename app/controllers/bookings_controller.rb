class BookingsController < ApplicationController

  def new
    @sizzler = Sizzler.find(params[:sizzler_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to root_path, notice: "Booking successfully created."
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
    params.require(:booking).permit(:date)
  end
end
