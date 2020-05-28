class Governor
  def judge(target)
    mitsu?(target) ? :mitsudesu : :notmitsudesu
  end

  private

  def mitsu?(target)
    mippei?(target) || missyuu?(target) || missetsu?(target) || target.social_distance_meter < 2
  end

  def mippei?(target)
    target.air_vent_count.zero? || target.refresh_air_time_per_hour < 2
  end

  def missyuu?(target)
    target.people_count >= 5
  end

  def missetsu?(target)
    target.is_each_touchable
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

