require 'rails_helper'   

RSpec.describe Management::SessionsHelper do 
  include Management::SessionsHelper

  let(:shop) { create(:shop) }

  describe 'sign_in' do
    context 'when sign_in' do
      it 'set session[:shop_id] = shop.id' do
        sign_in(shop)
        expect(session[:shop_id]).to eq(shop.id)
      end
    end
  end

  describe 'current_shop' do
    subject { current_shop }

    context 'call current_shop with sign_in' do
      it 'return sign in shop' do
        sign_in(shop)
        is_expected.to eq shop
      end
    end

    context 'call current_shop without sign_in' do
      it 'return nil' do
        is_expected.to be_nil
      end
    end
  end

  describe 'authenticated' do
    subject { authenticated? }

    context 'call authenticated with sign_in' do
      it 'return true' do
        sign_in(shop)
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
      it 'set session[:shop_id] = nil' do
        expect(sign_out).to be_nil
      end
    end
  end
end
