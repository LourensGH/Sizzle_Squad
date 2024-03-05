class SizzlersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @sizzlers = Sizzler.all
  end

  def show
    @sizzler = Sizzler.find(params[:id])
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
    params.require(:sizzler).permit(:title, :location, :cooking_style, :price, :speciality, :user_id)
  end
end
