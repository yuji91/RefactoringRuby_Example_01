class Order < ActiveRecord::Base
  def self.monthly_sales
    result = 0
    self.monthly.each do |order|
      result += order.sales - order.cost
    end
    return result
  end 

  scope :monthly, -> { where(created_at: Time.now.all_month) }
end

