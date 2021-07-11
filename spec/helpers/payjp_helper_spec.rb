require 'rails_helper'

RSpec.describe PayjpHelper, type: :helper do

  describe '#payjp_charge' do
    context 'charge by customer' do
      
      before do 
        token = Payjp::Token.create({
          :card => {
            :number => '4242424242424242',
            :cvc => '123',
            :exp_month => '2',
            :exp_year => '2024'
          }},
          {
          'X-Payjp-Direct-Token-Generate': 'true'
          }
        )

        @customer = Payjp::Customer.create(
          description: 'test',
          card: token.id
        )
      end

      after do 
        @customer.delete
      end

      it 'returns success response amount' do
        expect(helper.payjp_charge(100, @customer.id)['amount']).to eq(100)
      end
    end

    context 'charge by not customer' do
      it 'returns error response status:400' do
        expect { helper.payjp_charge(100, 'hoge') }.to raise_error(Payjp::InvalidRequestError)
      end
    end
  end
end
