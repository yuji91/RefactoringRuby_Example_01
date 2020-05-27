class Governor
  def judge(target)
    if mitsu?(target)
      :mitsudesu
    else
      :notmitsudesu
    end
  end

  private

  def mitsu?(target)
    target.air_vent_count.zero? || target.refresh_air_time_per_hour < 2 || target.people_count >= 5 || target.is_each_touchable == true || target.social_distance_meter < 2
  end
end

require 'teyu'

class Target
  extend Teyu
  teyu_init air_vent_count: 1,
   refresh_air_time_per_hour: 2,
   people_count: 5,
   is_each_touchable: false,
   social_distance_meter: 2

  attr_accessor :air_vent_count,
   :refresh_air_time_per_hour,
   :people_count,
   :is_each_touchable,
   :social_distance_meter
end

