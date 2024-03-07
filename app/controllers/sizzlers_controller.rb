class SizzlersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @sizzlers = Sizzler.all
    @user = current_user
  end

  def show
    @sizzler = Sizzler.find(params[:id])

    # Trigger geocoding if the sizzler's location has changed
    @markers = []

    if @sizzler.geocoded?
      @marker = {
        lat: @sizzler.latitude,
        lng: @sizzler.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {sizzler: @sizzler}),
        marker_html: render_to_string(partial: "marker")
      }
      @markers << @marker
    end
  end

  def new
    @sizzler = Sizzler.new
    @user = current_user
  end

  def create
    @sizzler = Sizzler.new(sizzler_params)

    if @sizzler.save!
      redirect_to sizzler_path(@sizzler), notice: "Sizzler was successfully created."
    else
      render :new, notice: 'couldnt create sizzler'
    end
  end

  private

  def sizzler_params
    params.require(:sizzler).permit(:title, :location, :cooking_style, :price, :speciality, :user_id, :photo)
  end
end
