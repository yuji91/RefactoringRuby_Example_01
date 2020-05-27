class Payment < ActiveRecord::Base
  TIME_SALE_START = Time.now.prev_week
  TIME_SALE_END = Time.now

  def price
    add_tax_to_price
    if has_coupon?
      coupon_price
    else
      if invited?
        invited_price
      else
        if in_time_sale?
          time_sale_price
        else
          normal_price
        end
      end
    end
  end

  private

  def has_coupon?
    self.coupon_code.present?
  end

  def invited?
    self.invited_user_id.present?
  end

  def in_time_sale?
    self.period >= TIME_SALE_START && self.period <= TIME_SALE_END
  end

  def add_tax_to_price
    self.base_price += base_price * 0.1
  end

  def coupon_price
    self.base_price - 10000
  end

  def invited_price
    self.base_price -= base_price * 0.2
  end

  def time_sale_price
    self.base_price -= base_price * 0.1
  end

  def normal_price
    self.base_price
  end
end

