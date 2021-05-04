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
      ) if params[:payjp_token][0, 1] == "tk"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.receipts.each do |receipt|
      receipt.user_id = nil
      receipt.save!
    end

    @user.coupons.each do |coupon|
      coupon.user_id = nil
      coupon.save!
    end

    @user.destroy
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:family_name, :given_name, :display_name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end

  def set_customer
    @customer = @user.customer
  end
end
