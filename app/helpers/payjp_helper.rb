# ==============================================================================
# app - helpers - payjp
# ==============================================================================
module PayjpHelper
  def payjp_charge(amount, customer_id)
    options = {
      amount: amount,
      currency: 'jpy',
      customer: customer_id,
    }
    Payjp::Charge.create(options)
  end
end
