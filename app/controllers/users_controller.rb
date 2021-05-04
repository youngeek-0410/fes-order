# ==============================================================================
# app - controller - users
# ==============================================================================
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_customer, only: [:update]
  skip_before_action :authenticate!, only: [:new, :create]

  def show
  end

  def new
    @user = User.new
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    customer = Payjp::Customer.create
    @user.customer_id = customer.id
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      @customer.cards.create(
        card: params[:payjp_token],
        default: true,
      ) if params[:payjp_token]
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
    @user = User.find(session[:user_id])
  end

  def set_customer
    @customer = @user.customer
  end
end
