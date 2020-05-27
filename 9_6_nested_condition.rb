class Payment < ActiveRecord::Base
  TIME_SALE_START = Time.now.prev_week
  TIME_SALE_END = Time.now

  def price
    add_tax_to_price
    if self.coupon_code.present?
      coupon_price
    else
      if self.invited_user_id.present?
        invited_price
      else
        if self.period >= TIME_SALE_START && self.period <= TIME_SALE_END
          time_sale_price
        else
          normal_price
        end
      end
    end
  end

  private

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

