require 'rails_helper'   

RSpec.describe Management::SessionsHelper do 
  include Management::SessionsHelper
  context 'sign_in' do
    before do
      @shop = create(:shop)    
      session[:shop_id] = @shop.id
    end

    it 'sign_in' do
      sign_in(@shop)
      expect(session[:shop_id]).to eq(@shop.id)
    end

    it 'display sign_in shop' do
      expect(current_shop.id).to eq(@shop.id)
    end

    it 'authenticated!' do
      expect(authenticated?).to eq(true)
    end

    it 'sign_out' do
      expect(sign_out).to eq(nil)
    end
  end

  context 'not sign_in' do
    it 'do not display sign_in shop' do
      expect(current_shop).to eq(nil)
    end

    it 'not authenticated' do
      expect(authenticated?).to eq(false)
    end
  end
end
