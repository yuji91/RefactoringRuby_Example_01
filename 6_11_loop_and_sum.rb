class Order < ActiveRecord::Base
  scope :monthly, -> { where(created_at: Time.now.all_month) }

  def self.monthly_sales
    @_monthly_sales ||= monthly.map { |order| order.sales - order.cost }.sum
  end
end

