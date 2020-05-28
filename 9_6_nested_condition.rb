class Payment < ActiveRecord::Base
  TIME_SALE_START = Time.now.prev_week
  TIME_SALE_END = Time.now

  def price
    add_tax_to_price
    return coupon_price if has_coupon?
    return invited_price if invited?
    return time_sale_price if in_time_sale?

    normal_price
  end

  private

  def has_coupon?
    coupon_code.present?
  end

  def invited?
    invited_user_id.present?
  end

  def in_time_sale?
    period >= TIME_SALE_START && period <= TIME_SALE_END
  end

  def add_tax_to_price
    self.base_price += base_price * 0.1
  end

  def coupon_price
    base_price - 10000
  end

  def invited_price
    self.base_price -= base_price * 0.2
  end

  def time_sale_price
    self.base_price -= base_price * 0.1
  end

  def normal_price
    base_price
  end
end

