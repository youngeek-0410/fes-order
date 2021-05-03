# ==============================================================================
# app - controller - users
# ==============================================================================
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    params = user_params
    if @user.update_attributes(params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :given_name, :display_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
