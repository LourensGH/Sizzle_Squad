class SizzlersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @user = current_user
    if params[:radius].present?
      redirect_to nearby_sizzlers_path(radius: params[:radius])
    elsif params[:query].present?
      @sizzlers = Sizzler.global_search(params[:query])
    else
      @sizzlers = Sizzler.all
    end
  end

  def show
    @sizzler = Sizzler.find(params[:id])

    # Trigger geocoding if the sizzler's location has changed
    @markers = []

    if @sizzler.geocoded?
      @marker = {
        lat: @sizzler.latitude,
        lng: @sizzler.longitude
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

    if params[:sizzler][:photos].present?
      params[:sizzler][:photos].each do |key, photo|
        @sizzler.photos.attach(photo)
      end
    end

    if @sizzler.save!
      redirect_to sizzler_path(@sizzler), notice: "Sizzler was successfully created."
    else
      render :new, notice: 'couldnt create sizzler'
    end
  end

  def upload_photos
    @sizzler = Sizzler.find(params[:id])
    @sizzler.photos.attach(params[:sizzler][:photos])
    redirect_to @sizzler
  end

  def nearby_sizzlers
    @radius = params[:radius].presence || 10 # Default radius to 10 kilometers if not specified
    @user_location = current_user&.location
    if @user_location.present?
      @sizzlers = Sizzler.near(@user_location, @radius)
    else
      @sizzlers = []
    end
    render :index
  end

  private

  def sizzler_params
    params.require(:sizzler).permit(:title, :location, :cooking_style, :price, :speciality, :user_id)
  end
end
