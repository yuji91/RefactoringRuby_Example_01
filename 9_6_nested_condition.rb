class Payment < ActiveRecord::Base
  TIME_SALE_START = Time.now.prev_week
  TIME_SALE_END = Time.now
  TAX_RATE = 0.1
  INVITATION_DISCOUNT_RATE = 0.2
  TIME_SALE_DISCOUNT_RATE = 0.1
  COUPON_PRICE = 10_000

  def price
    # add_tax_to_price
    calculated_price = base_price * (1 + TAX_RATE)

    return calculated_price - COUPON_PRICE if coupon_code.present?
    return calculated_price - calculated_price * INVITATION_DISCOUNT_RATE if invited_user_id?
    return calculated_price - calculated_price * TIME_SALE_DISCOUNT_RATE if period >= TIME_SALE_START && period <= TIME_SALE_END

    calculated_price
  end
end

