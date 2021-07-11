require 'rails_helper'   

RSpec.describe SessionsHelper do 
  include SessionsHelper

  let(:user) { create(:user) }

  describe 'sign_in' do
    context 'when sign_in' do
      it 'set session[:user_id] = user.id' do
        sign_in(user)
        expect(session[:user_id]).to eq(user.id)
      end
    end
  end

  describe 'current_user' do
    subject { current_user }

    context 'call current_user with sign_in' do
      it 'return sign in user' do
        sign_in(user)
        is_expected.to eq user
      end
    end

    context 'call current_user without sign_in' do
      it 'return nil' do
        is_expected.to be_nil
      end
    end
  end

  describe 'authenticated' do
    subject { authenticated? }

    context 'call authenticated with sign_in' do
      it 'return true' do
        sign_in(user)
        is_expected.to be_truthy
      end
    end

    context 'call authenticated without sign_in' do
      it 'return false' do
        is_expected.to be_falsey
      end
    end
  end
  
  describe 'sign_out' do
    context 'call sign_out' do
      it 'set session[:user_id] = nil' do
        expect(sign_out).to be_nil
      end
    end
  end
end
