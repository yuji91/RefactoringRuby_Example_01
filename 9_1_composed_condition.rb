class Governor
  def judge(target)
    target.mitsudesu? ? :mitsudesu : :notmitsudesu
  end
end

require 'teyu'

class Target
  extend Teyu

  MAX_PEOPLE = 5
  MIN_REFRESH_AIR_TIME_PER_HOUR = 2
  MIN_AIR_VENT_COUNT = 1
  MIN_SOCIAL_DISTANCE_METER = 2

  teyu_init air_vent_count: MIN_AIR_VENT_COUNT,
   refresh_air_time_per_hour: MIN_REFRESH_AIR_TIME_PER_HOUR,
   people_count: MAX_PEOPLE,
   is_each_touchable: false,
   social_distance_meter: MIN_SOCIAL_DISTANCE_METER

  attr_accessor :air_vent_count,
   :refresh_air_time_per_hour,
   :people_count,
   :is_each_touchable,
   :social_distance_meter

  def mitsudesu?
    return true if air_vent_count < MIN_AIR_VENT_COUNT
    return true if refresh_air_time_per_hour < MIN_REFRESH_AIR_TIME_PER_HOUR
    return true if people_count >= MAX_PEOPLE
    return true if is_each_touchable
    return true if social_distance_meter < MIN_SOCIAL_DISTANCE_METER

    false
  end
end

