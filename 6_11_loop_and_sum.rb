class Order < ActiveRecord::Base
  def self.monthly_sales
    self.monthly.sum { |order| order.sales - order.cost }
  end

  scope :monthly, -> { where(created_at: Time.now.all_month) }
end

