class UsersController < ApplicationController
  def index
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
  end
end