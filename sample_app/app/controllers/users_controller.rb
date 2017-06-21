class UsersController < ApplicationController
  #https://stackoverflow.com/questions/6885990/rails-params-explained
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
end
