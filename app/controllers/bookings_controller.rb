class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @sizzler = Sizzler.find(params[:sizzler_id])
    @booking = Booking.new
    @user = current_user
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to sizzler_booking_path(@booking.sizzler.id, @booking.id), notice: "Booking successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @bookings = Booking.all
    # @booking = Booking.find(params[:id])
    # @sizzler = @booking.sizzler
  end

  def destroy
    @booking = Booking.find(params[:id])
    @sizzler = @booking.sizzler
    @booking.destroy
    redirect_to sizzler_booking_path(@sizzler)
  end

  def accept
    @sizzler = Sizzler.find(params[:sizzler_id])
    @booking = Booking.find(params[:id])
    @booking.update(accepted: "accepted")
    redirect_to page_path(@sizzler)
  end

  def decline
    @sizzler = Sizzler.find(params[:sizzler_id])
    @booking = Booking.find(params[:id])
    @booking.update(accepted: "declined")
    redirect_to page_path(@sizzler)
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :sizzler_id, :user_id, :accepted)
  end

end
