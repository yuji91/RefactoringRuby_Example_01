class Payment < ActiveRecord::Base
  TIME_SALE_START = Time.now.prev_week
  TIME_SALE_END = Time.now

  def price
    # add_tax_to_price
    self.base_price += base_price * 0.1
    if self.coupon_code.present?
      self.base_price - 10000
    else
      if self.invited_user_id.present?
        self.base_price -= base_price * 0.2
      else
        if self.period >= TIME_SALE_START && self.period <= TIME_SALE_END
          self.base_price -= base_price * 0.1
        else
          normal_price
        end
      end
    end
  end

  private

  def normal_price
    self.base_price
  end
end

