class SizzlersController < ApplicationController
  def index
    @sizzlers = Sizzler.all
  end

  def show
    @sizzler = Sizzler.find(params[:id])
  end

  def new
    @sizzler = Sizzler.new
  end

  def create
    @sizzler = Sizzler.new(sizzler_params)

    if @sizzler.save!
      redirect_to sizzler_path(@sizzler), notice: "Sizzler was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def sizzler_params
    params.require(:sizzler).permit(:title, :location, :cooking_style, :price, :speciality, :user_id)
  end
end
