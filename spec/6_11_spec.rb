RSpec.describe do
  require './6_11_loop_and_sum.rb'

  Order.create(sales: 20, cost: 10, created_at: Time.now)
  Order.create(sales: 30, cost: 15, created_at: Time.now)
  Order.create(sales: 50, cost: 25, created_at: Time.now)
  Order.create(sales: 50, cost: 25, created_at: Time.now.prev_month)

  describe 'monthly_sales' do
    it 'is not include prev_month sales' do
      expect(Order.monthly_sales).to eq 50
    end
  end
end

