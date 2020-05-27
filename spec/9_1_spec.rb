RSpec.describe do
  require './9_1_composed_condition.rb'

  let!(:koike) { Governor.new }
  let(:no_air_vent) { Target.new(air_vent_count: 0) }
  let(:not_enough_air_refresh_time) { Target.new(refresh_air_time_per_hour: rand(0..1)) }
  let(:too_many_people) { Target.new(people_count: 100) }
  let(:each_touchable) { Target.new(is_each_touchable: true) }
  let(:close_distance) { Target.new(social_distance_meter: 1) }
  let(:not_mitsu) { Target.new(air_vent_count: 1,
                               refresh_air_time_per_hour: 2, 
                               people_count: 4,
                               is_each_touchable: false,
                               social_distance_meter: 2) }

  describe 'judge' do
    it { expect(koike.judge(no_air_vent)).to eq :mitsudesu }
    it { expect(koike.judge(not_enough_air_refresh_time)).to eq :mitsudesu }
    it { expect(koike.judge(too_many_people)).to eq :mitsudesu }
    it { expect(koike.judge(each_touchable)).to eq :mitsudesu }
    it { expect(koike.judge(close_distance)).to eq :mitsudesu }
    it { expect(koike.judge(not_mitsu)).to eq :notmitsudesu }
  end
end

