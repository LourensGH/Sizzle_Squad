class SizzlersController < ApplicationController
  def index
    @sizzlers = Sizzler.all
  end

  def show
    @sizzler = Sizzler.find(params[:id])
  end
end
