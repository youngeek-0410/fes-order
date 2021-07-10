require 'rails_helper'   

RSpec.describe SessionsHelper do 
  include SessionsHelper
  context 'sign_in' do
    before do
      @user = create(:user)    
      session[:user_id] = @user.id
    end

    it 'sign_in' do
      sign_in(@user)
      expect(session[:user_id]).to eq(@user.id)
    end

    it 'display sign_in user' do
      expect(current_user.id).to eq(@user.id)
    end

    it 'authenticated!' do
      expect(authenticated?).to eq(true)
    end

    it 'sign_out' do
      expect(sign_out).to eq(nil)
    end
  end

  context 'not sign_in' do
    it 'do not display sign_in user' do
      expect(current_user).to eq(nil)
    end

    it 'not authenticated' do
      expect(authenticated?).to eq(false)
    end
  end
end
