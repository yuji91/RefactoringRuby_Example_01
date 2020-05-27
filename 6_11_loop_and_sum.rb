class Order < ActiveRecord::Base
  def self.monthly_sales
    self.monthly.inject(0) { |result, order| result += (order.sales - order.cost) }
  end

  scope :monthly, -> { where(created_at: Time.now.all_month) }
end

