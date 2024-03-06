class PagesController < ApplicationController
  def index
    @user = current_user
  end

  def sign_out
    @user = current_user
  end
end
