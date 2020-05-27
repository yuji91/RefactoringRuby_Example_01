RSpec.describe do
  require './9_6_nested_condition.rb'

  BASE_PRICE = 30000
  payment_with_coupon_and_invited_in_sale = Payment.new(base_price: BASE_PRICE, coupon_code: "CPN_202005271200", invited_user_id: 1, period: Time.now.yesterday) 
  payment_without_coupon_and_invited_in_sale = Payment.new(base_price: BASE_PRICE, coupon_code: nil, invited_user_id: 1, period: Time.now.yesterday) 
  payment_without_coupon_and_not_invited_in_sale = Payment.new(base_price: BASE_PRICE, coupon_code: nil, invited_user_id: nil, period: Time.now.yesterday) 
  payment_without_coupon_and_not_invited_out_sale = Payment.new(base_price: BASE_PRICE, coupon_code: nil, invited_user_id: nil, period: Time.now.prev_month) 

  TAXED_PRICE = BASE_PRICE + BASE_PRICE * 0.1
  COUPON_PRICE = TAXED_PRICE - 10000 
  INVITED_PRICE = TAXED_PRICE - TAXED_PRICE * 0.2
  TIME_SALED_PRICE = TAXED_PRICE - TAXED_PRICE * 0.1

  describe 'price' do
    context '割引が適用されている場合' do
      it { expect(payment_with_coupon_and_invited_in_sale.price).to eq COUPON_PRICE } # クーポン割引のみが適用
      it { expect(payment_without_coupon_and_invited_in_sale.price).to eq INVITED_PRICE } # 紹介割引のみが適用
      it { expect(payment_without_coupon_and_not_invited_in_sale.price).to eq TIME_SALED_PRICE } # タイムセール割引が適用
    end

    context '割引が適用されていない場合' do
      it { expect(payment_without_coupon_and_not_invited_out_sale.price).to eq TAXED_PRICE } # 通常の課税済価格が適用
    end
  end
end

