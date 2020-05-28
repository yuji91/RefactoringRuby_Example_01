class User < ActiveRecord::Base
  # このコードのリファクタリングでは、spec/8_16_spec.rbも変更してください。
  MIN_SUCCESS_MEDIAN_SCORE_RATE = 50
  MIN_SUCCESS_AVERAGE_SCORE_RATE = 50

  # 中央値と平均値以上はA, 中央値以上はB, それ以外はC
  def rank
    if score >= median_score && score >= average_score
      return :A
    elsif score >= median_score
      return :B
    else
      return :C
    end
  end

  # 中央値と平均値の半分以下の点数は落第
  def failed?
    return false if score > median_score * (MIN_SUCCESS_MEDIAN_SCORE_RATE / 100.0)
    return false if score > average_score * (MIN_SUCCESS_AVERAGE_SCORE_RATE / 100.0)

    true
  end

  private

  def median_score
    scores = User.pluck(:score)
    @_media_score ||= scores.median.to_i
  end

  def average_score
    scores = User.pluck(:score)
    @_average_score ||= scores.average.to_i
  end
end

